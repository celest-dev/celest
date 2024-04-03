package dev.celest.native_storage

import android.content.Context
import android.content.SharedPreferences
import androidx.annotation.Keep

@Keep
class NativeLocalStorage(
    context: Context,
    namespace: String,
    scope: String?,
) : NativeStorage(context, namespace, scope) {

    override val sharedPreferences: SharedPreferences =
        context.getSharedPreferences(namespace, Context.MODE_PRIVATE)

}