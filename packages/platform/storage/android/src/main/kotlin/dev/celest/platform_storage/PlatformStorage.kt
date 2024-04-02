package dev.celest.platform_storage

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import androidx.annotation.Keep

/**
 * Base class for platform storage implementations.
 */
@Keep
sealed class PlatformStorage(
    protected val mainActivity: Activity,
    protected val namespace: String,
    private val scope: String?,
) {

    /**
     * The implementation-specific SharedPreferences instance.
     */
    protected abstract val sharedPreferences: SharedPreferences

    /**
     * The prefix to set on all keys.
     */
    private val prefix: String = if (scope != null) "$scope/" else ""

    private val editor: SharedPreferences.Editor
        get() = sharedPreferences.edit()

    fun write(key: String, value: String?) {
        with(editor) {
            putString("$prefix$key", value)
            apply()
        }
    }

    fun read(key: String): String? = sharedPreferences.getString("$prefix$key", null)

    fun delete(key: String): String? {
        val current = read("$prefix$key")
        with(editor) {
            remove("$prefix$key")
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