package dev.celest.celest_auth

import android.annotation.SuppressLint
import android.app.Activity
import android.content.SharedPreferences
import androidx.annotation.Keep
import androidx.annotation.Nullable
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey

// TODO(dnys1): Exclude from backup:
// - https://developer.android.com/reference/androidx/security/crypto/EncryptedSharedPreferences
// - https://developer.android.com/guide/topics/data/autobackup#IncludingFiles
@Keep
class CelestSecureStorage(private val mainActivity: Activity) {

    private val sharedPreferences: SharedPreferences by lazy {
        val masterKey = MasterKey.Builder(mainActivity)
            .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
            .build()
        val sharedPreferences = EncryptedSharedPreferences.create(
            mainActivity,
            "auth_secrets",
            masterKey,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM,
        )
        sharedPreferences
    }

    private val editor: SharedPreferences.Editor
        get() = sharedPreferences.edit()

    fun write(dataKey: String, value: String?) {
        with(editor) {
            putString(dataKey, value)
            apply()
        }
    }

    fun read(dataKey: String): String? = sharedPreferences.getString(dataKey, null)

    fun readAll(): Map<String, String> = sharedPreferences.all.mapValues { it.value as String }

    fun delete(dataKey: String): String? {
        val current = read(dataKey)
        with(editor) {
            remove(dataKey)
            apply()
        }
        return current
    }

    fun clear() {
        with(editor) {
            clear()
            apply()
        }
    }

}