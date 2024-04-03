package dev.celest.native_storage

import android.content.Context
import android.content.SharedPreferences
import androidx.annotation.Keep

/**
 * Base class for native storage implementations.
 */
@Keep
sealed class NativeStorage(
    protected val context: Context,
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
    private val prefix: String = if (scope.isNullOrEmpty()) "" else "$scope/"

    private val editor: SharedPreferences.Editor
        get() = sharedPreferences.edit()

    fun write(key: String, value: String?) {
        println("Writing: $prefix$key")
        with(editor) {
            putString("$prefix$key", value)
            apply()
        }
    }

    fun read(key: String): String? {
        println("Reading: $prefix$key")
        return sharedPreferences.getString("$prefix$key", null)
    }

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