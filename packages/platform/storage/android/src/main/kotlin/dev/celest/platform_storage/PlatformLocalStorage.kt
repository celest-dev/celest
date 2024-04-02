package dev.celest.platform_storage

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import androidx.annotation.Keep

@Keep
class PlatformLocalStorage(
    mainActivity: Activity,
    namespace: String,
    scope: String?,
) : PlatformStorage(mainActivity, namespace, scope) {

    override val sharedPreferences: SharedPreferences =
        mainActivity.getSharedPreferences(namespace, Context.MODE_PRIVATE)

}