package dev.celest.platform_storage

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import androidx.annotation.Keep

@Keep
class PlatformLocalStorage(
    context: Context,
    namespace: String,
    scope: String?,
) : PlatformStorage(context, namespace, scope) {

    override val sharedPreferences: SharedPreferences =
        context.getSharedPreferences(namespace, Context.MODE_PRIVATE)

}