package dev.celest.platform_storage

import android.app.Activity
import android.content.SharedPreferences
import androidx.annotation.Keep
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey

// TODO(dnys1): Exclude from backup:
// - https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences
// - https://developer.android.com/guide/topics/data/autobackup#IncludingFiles
@Keep
class PlatformSecureStorage(
    mainActivity: Activity,
    namespace: String,
    scope: String?,
) : PlatformStorage(mainActivity, namespace, scope) {

    override val sharedPreferences: SharedPreferences by lazy {
        val masterKey = MasterKey.Builder(mainActivity)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()
        val sharedPreferences = EncryptedSharedPreferences.create(
            mainActivity,
            when (scope) {
                null -> namespace
                else -> "$namespace.$scope"
            },
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM,
        )
        sharedPreferences
    }

}