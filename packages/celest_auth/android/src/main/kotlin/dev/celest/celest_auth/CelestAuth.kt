package dev.celest.celest_auth

import android.app.Activity
import android.content.Context
import android.os.CancellationSignal
import android.service.voice.VoiceInteractionSession.ActivityId
import androidx.annotation.Keep
import androidx.credentials.CreateCredentialResponse
import androidx.credentials.CreatePublicKeyCredentialRequest
import androidx.credentials.CredentialManager
import androidx.credentials.CredentialManagerCallback
import androidx.credentials.GetCredentialRequest
import androidx.credentials.GetCredentialResponse
import androidx.credentials.GetPublicKeyCredentialOption
import androidx.credentials.exceptions.CreateCredentialException
import androidx.credentials.exceptions.GetCredentialException
import com.google.android.gms.fido.Fido
import kotlinx.coroutines.coroutineScope
import java.util.concurrent.Executors
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine

@Keep
class CelestAuth(private val mainActivity: Activity) {
    private val credentialManager: CredentialManager = CredentialManager.create(mainActivity)
    private val executor = Executors.newCachedThreadPool()

    fun register(
        requestJson: String,
        callback: CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>,
    ): CancellationSignal {
        val request = CreatePublicKeyCredentialRequest(
            requestJson = requestJson,
            preferImmediatelyAvailableCredentials = true
        )
        val cancellationSignal = CancellationSignal()
        credentialManager.createCredentialAsync(
            mainActivity,
            request,
            cancellationSignal,
            executor,
            callback,
        )
        return cancellationSignal
    }

    fun authenticate(
        requestJson: String,
        callback: CredentialManagerCallback<GetCredentialResponse, GetCredentialException>,
    ): CancellationSignal {
        val request = GetCredentialRequest.Builder().addCredentialOption(
            GetPublicKeyCredentialOption(requestJson = requestJson)
        ).build()
        val cancellationSignal = CancellationSignal()
        credentialManager.getCredentialAsync(
            mainActivity,
            request,
            cancellationSignal,
            executor,
            callback,
        )
        return cancellationSignal
    }
}