#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#else
#error("Unsupported OS")
#endif

import AuthenticationServices

public typealias OnSuccess = (UnsafePointer<UInt8>) -> Void
public typealias OnError = (CelestAuthErrorCode, UnsafePointer<UInt8>) -> Void

@objc public enum CelestAuthErrorCode: Int, RawRepresentable {
    case unknown = 0
    case unsupported = 1
    case serde = 2
}

@objc protocol CelestAuthProtocol: NSObjectProtocol {
    /// Whether passkeys are supported on the current platform.
    @objc var isPasskeysSupported: Bool { get }

    /// Sends a registration request to the platform authenticator and
    /// completes with the registration response or an error.
    @objc func register(
        request: String,
        onSuccess: @escaping OnSuccess,
        onError: @escaping OnError
    )
    
    /// Sends an authentication request to the platform authenticator and
    /// completes with the authentication response or an error.
    @objc func authenticate(
        request: String,
        onSuccess: @escaping OnSuccess,
        onError: @escaping OnError
    )
}

@objc public class CelestAuth: NSObject, CelestAuthProtocol {
    @objc public override init() {
        if #available(iOS 15.0, macOS 12.0, *) {
            self.impl = CelestAuthSupported()
        } else {
            self.impl = CelestAuthUnsupported()
        }
    }
    
    private let impl: CelestAuthProtocol
    
    @objc public var isPasskeysSupported: Bool {
        impl.isPasskeysSupported
    }
    
    @objc public func register(request: String, onSuccess: @escaping OnSuccess, onError: @escaping OnError) {
        impl.register(request: request, onSuccess: onSuccess, onError: onError)
    }
    
    @objc public func authenticate(request: String, onSuccess: @escaping OnSuccess, onError: @escaping OnError) {
        impl.authenticate(request: request, onSuccess: onSuccess, onError: onError)
    }
    
    @objc public func freePointer(_ ptr: UnsafePointer<UInt8>) {
        ptr.deallocate()
    }
}

@available(iOS 15.0, macOS 12.0, *)
class CelestAuthSupported: NSObject, CelestAuthProtocol, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    private var onSuccess: OnSuccess?
    private var onError: OnError?
    
    var isPasskeysSupported: Bool { true }
    
    func register(
        request: String,
        onSuccess: @escaping OnSuccess,
        onError: @escaping OnError
    ) {
        guard let data = request.data(using: .utf8),
              let options = try? JSONDecoder().decode(PasskeyRequestOptions.self, from: data),
              let challenge = Data(base64URLEncoded: options.challenge),
              let userID = options.user.id.data(using: .utf8)
        else {
            onError(.serde, "Failed to deserialize registration request")
            return
        }
        self.onSuccess = onSuccess
        self.onError = onError
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: options.rp.id)
        let platformKeyRequest = platformProvider.createCredentialRegistrationRequest(
            challenge: challenge,
            name: options.user.name,
            userID: userID
        )
        let authController = ASAuthorizationController(authorizationRequests: [platformKeyRequest])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }
    
    func authenticate(
        request: String,
        onSuccess: @escaping OnSuccess,
        onError: @escaping OnError
    ) {
        guard let data = request.data(using: .utf8),
              let options = try? JSONDecoder().decode(PasskeyAuthenticationOptions.self, from: data),
              let challenge = Data(base64URLEncoded: options.challenge)
        else {
            onError(.serde, "Failed to deserialize authentication request")
            return
        }
        self.onSuccess = onSuccess
        self.onError = onError
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: options.rpId)
        let platformKeyRequest = platformProvider.createCredentialAssertionRequest(challenge: challenge)
        let authController = ASAuthorizationController(authorizationRequests: [platformKeyRequest])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }
    
    private func reset() {
        self.onSuccess = nil
        self.onError = nil
    }
    
    private func complete(value: Data) {
        onSuccess?(value.unsafePointer)
        reset()
    }
    
    private func complete(error: CelestAuthErrorCode, _ message: String) {
        onError?(error, message.unsafePointer)
        reset()
    }
    
    private func complete(error: Error) {
        onError?(.unknown, error.localizedDescription.unsafePointer)
        reset()
    }

    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        #if os(iOS)
        ASPresentationAnchor()
        #else
        let windows = NSApplication.shared.windows
        var presentationAnchor = windows.first
        for window in windows {
            if window.isKeyWindow {
                presentationAnchor = window
            }
        }
        return presentationAnchor ?? ASPresentationAnchor()
        #endif
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialRegistration {
            let response = PasskeyRegistration(credential: credential)
            guard let responseJson = try? JSONEncoder().encode(response) else {
                complete(error: .serde, "Failed to serialize registration response")
                return
            }
            return complete(value: responseJson)
        } else if let credential = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialAssertion {
            let response = PasskeyAuthentication(credential: credential)
            guard let responseJson = try? JSONEncoder().encode(response) else {
                complete(error: .serde, "Failed to serialize authentication response")
                return
            }
            return complete(value: responseJson)
        } else {
            complete(error: .unknown, "Unknown credential type: \(authorization.self)")
        }
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        complete(error: error)
    }
}

class CelestAuthUnsupported: NSObject, CelestAuthProtocol {
    var isPasskeysSupported: Bool { false }
    
    func register(request: String, onSuccess: @escaping OnSuccess, onError: @escaping OnError) {
        onError(.unsupported, "Unsupported platform".unsafePointer)
    }
    
    func authenticate(request: String, onSuccess: @escaping OnSuccess, onError: @escaping OnError) {
        onError(.unsupported, "Unsupported platform".unsafePointer)
    }
}

struct PasskeyRequestOptions: Codable {
    let challenge: String
    let rp: PasskeyRequestRp
    let user: PasskeyRequestUser
}

struct PasskeyRequestRp: Codable {
    let name: String
    let id: String
}

struct PasskeyRequestUser: Codable {
    let id: String
    let name: String
    let displayName: String
}

struct PasskeyAuthenticationOptions: Codable {
    let rpId: String
    let challenge: String
}

@available(iOS 15.0, macOS 12.0, *)
struct PasskeyRegistration: Codable {
    init(credential: ASAuthorizationPlatformPublicKeyCredentialRegistration) {
        let credentialID = credential.credentialID.base64URLEncodedString()
        self.id = credentialID
        self.rawId = credentialID
        self.response = PasskeyRegistrationResponse(
            clientDataJSON: credential.rawClientDataJSON.base64URLEncodedString(),
            attestationObject: credential.rawAttestationObject?.base64URLEncodedString()
        )
        if #available(iOS 16.6, macOS 13.5, *) {
            switch credential.attachment {
            case .platform:
                self.authenticatorAttachment = "platform"
            case .crossPlatform:
                self.authenticatorAttachment = "cross-platform"
            @unknown default:
                self.authenticatorAttachment = "unknown"
            }
        } else {
            self.authenticatorAttachment = nil
        }
    }
    
    let id: String
    let rawId: String
    var type = "public-key"
    let response: PasskeyRegistrationResponse
    let authenticatorAttachment: String?
}

struct PasskeyRegistrationResponse: Codable {
    let clientDataJSON: String
    let attestationObject: String?
}

@available(iOS 15.0, macOS 12.0, *)
struct PasskeyAuthentication: Codable {
    init(credential: ASAuthorizationPlatformPublicKeyCredentialAssertion) {
        let credentialID = credential.credentialID.base64URLEncodedString()
        self.id = credentialID
        self.rawId = credentialID
        self.response = PasskeyAuthenticationResponse(
            clientDataJSON: credential.rawClientDataJSON.base64URLEncodedString(),
            authenticatorData: credential.rawAuthenticatorData.base64URLEncodedString(),
            signature: credential.signature.base64URLEncodedString(),
            userHandle: credential.userID.base64URLEncodedString()
        )
        if #available(iOS 16.6, macOS 13.5, *) {
            switch credential.attachment {
            case .platform:
                self.authenticatorAttachment = "platform"
            case .crossPlatform:
                self.authenticatorAttachment = "cross-platform"
            @unknown default:
                self.authenticatorAttachment = "unknown"
            }
        } else {
            self.authenticatorAttachment = nil
        }
    }
    
    let id: String
    let rawId: String
    var type: String = "public-key"
    let response: PasskeyAuthenticationResponse
    let authenticatorAttachment: String?
}

struct PasskeyAuthenticationResponse: Codable {
    let clientDataJSON: String
    let authenticatorData: String
    let signature: String
    let userHandle: String
}

extension Data {

    /// Instantiates data by decoding a base64url string into base64
    ///
    /// - Parameter string: A base64url encoded string
    init?(base64URLEncoded string: String) {
        self.init(base64Encoded: string.toggleBase64URLSafe(on: false))
    }

    /// Encodes the string into a base64url safe representation
    ///
    /// - Returns: A string that is base64 encoded but made safe for passing
    ///            in as a query parameter into a URL string
    func base64URLEncodedString() -> String {
        return self.base64EncodedString().toggleBase64URLSafe(on: true)
    }
    
    
    var unsafePointer: UnsafeMutablePointer<UInt8> {
        let ptr = UnsafeMutablePointer<UInt8>.allocate(capacity: count + 1)
        copyBytes(to: ptr, count: count)
        return ptr
    }

}

extension String {
    
    var unsafePointer: UnsafeMutablePointer<UInt8> {
        data(using: .utf8)!.unsafePointer
    }

    /// Encodes or decodes into a base64url safe representation
    ///
    /// - Parameter on: Whether or not the string should be made safe for URL strings
    /// - Returns: if `on`, then a base64url string; if `off` then a base64 string
    func toggleBase64URLSafe(on: Bool) -> String {
        if on {
            // Make base64 string safe for passing into URL query params
            let base64url = self.replacingOccurrences(of: "/", with: "_")
                .replacingOccurrences(of: "+", with: "-")
                .replacingOccurrences(of: "=", with: "")
            return base64url
        } else {
            // Return to base64 encoding
            var base64 = self.replacingOccurrences(of: "_", with: "/")
                .replacingOccurrences(of: "-", with: "+")
            // Add any necessary padding with `=`
            if base64.count % 4 != 0 {
                base64.append(String(repeating: "=", count: 4 - base64.count % 4))
            }
            return base64
        }
    }

}
