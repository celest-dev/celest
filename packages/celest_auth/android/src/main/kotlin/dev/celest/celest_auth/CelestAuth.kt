package dev.celest.celest_auth

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.annotation.Keep
import androidx.credentials.CredentialManager
import androidx.credentials.CustomCredential
import androidx.credentials.GetCredentialRequest
import androidx.credentials.GetCredentialResponse
import androidx.credentials.exceptions.GetCredentialException
import com.google.android.gms.tasks.OnSuccessListener
import com.google.android.libraries.identity.googleid.GetGoogleIdOption
import com.google.android.libraries.identity.googleid.GoogleIdTokenCredential
import kotlinx.coroutines.coroutineScope

@Keep
class CelestAuthListener: BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        TODO("Not yet implemented")
    }
}

@Keep
class CelestAuth {
    private lateinit var context: Context
    private lateinit var credentialManager: CredentialManager

    fun init(context: Context) {
        this.context = context
        credentialManager = CredentialManager.create(context)
    }

    fun signInWithCustomTabs(
        uri: Uri,
        onSuccess: () -> Unit,
        onError: (Exception) -> Unit,
    ) {

    }

    // Adapted from: https://developer.android.com/training/sign-in/credential-manager
    suspend fun signInWithGoogle(
        clientId: String,
        nonce: String
    ) {
        // TODO: GetSignInWithGoogleOption?
        val googleIdOption = GetGoogleIdOption.Builder()
            .setFilterByAuthorizedAccounts(true)
            .setAutoSelectEnabled(true)
            .setServerClientId(clientId)
            .setNonce(nonce)
            .build()
        val request = GetCredentialRequest.Builder()
            .addCredentialOption(googleIdOption)
            .build()
        coroutineScope {
            try {
                val result = credentialManager.getCredential(context, request)
            } catch (e: GetCredentialException) {
                TODO()
            }
        }
    }

    fun handleSignIn(result: GetCredentialResponse) {
        when (val credential = result.credential) {
            is CustomCredential -> {
                if (credential.type == GoogleIdTokenCredential.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL) {
                    // Use googleIdTokenCredential and extract id to validate and
                    // authenticate on your server.
                    val googleIdTokenCredential = GoogleIdTokenCredential
                        .createFrom(credential.data)
                }
            }
        }
    }
}