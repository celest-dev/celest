package dev.celest.platform_storage

import android.app.Activity
import android.content.SharedPreferences
import androidx.annotation.Keep

/**
 * Base class for platform storage implementations.
 */
@Keep
sealed class PlatformStorage(
    protected val mainActivity: Activity,
    protected val namespace: String,
    protected val scope: String?,
) {

    /**
     * The implementation-specific SharedPreferences instance.
     */
    protected abstract val sharedPreferences: SharedPreferences

    private val editor: SharedPreferences.Editor
        get() = sharedPreferences.edit()

    fun write(dataKey: String, value: String?) {
        with(editor) {
            putString(dataKey, value)
            apply()
        }
    }

    fun read(dataKey: String): String? = sharedPreferences.getString(dataKey, null)

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