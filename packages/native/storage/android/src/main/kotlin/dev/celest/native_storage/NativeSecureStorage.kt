package dev.celest.native_storage

import android.content.Context
import android.content.SharedPreferences
import androidx.annotation.Keep
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey

// TODO(dnys1): Exclude from backup:
// - https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences
// - https://developer.android.com/guide/topics/data/autobackup#IncludingFiles
@Keep
class NativeSecureStorage(
    context: Context,
    namespace: String,
    scope: String?,
) : NativeStorage(context, namespace, scope) {

    override val sharedPreferences: SharedPreferences by lazy {
        val masterKey = MasterKey.Builder(context)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()
        val sharedPreferences = EncryptedSharedPreferences.create(
            context,
            namespace,
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM,
        )
        sharedPreferences
    }

}