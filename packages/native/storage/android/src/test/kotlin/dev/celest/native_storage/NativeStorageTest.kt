package dev.celest.native_storage

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(Suite::class)
@Suite.SuiteClasses(
    DefaultsTest::class,
    CustomNamespaceTest::class,
    CustomScopeTest::class,
    EmptyScopeTest::class,
)
class NativeStorageTest

class DefaultsTest : NativeStorageTestBase()

class CustomNamespaceTest : NativeStorageTestBase() {
    override val namespace = "my.custom.namespace"
}

class CustomScopeTest : NativeStorageTestBase() {
    override val namespace = "my.custom.namespace"
    override val scope = "custom-scope"
}

class EmptyScopeTest : NativeStorageTestBase() {
    override val namespace = "my.custom.namespace"
    override val scope = ""

    @Test
    fun sharesWithNullScope() {
        val localNull = NativeLocalStorage(context, namespace, null)
        localStorage.write("hello", "world")
        assertEquals("world", localNull.read("hello"))

        // TODO: Not working
//        val secureNull = NativeSecureStorage(context, namespace, "")
//        secureStorage.write("hello", "world")
//        assertEquals("world", secureNull.read("hello"))
    }

    @Test
    fun twoInstances() {
        val inst1 = NativeSecureStorage(context, defaultNamespace, "")
        val inst2 = NativeSecureStorage(context, defaultNamespace, "")

        inst1.write("hello", "world")
        assertEquals("world", inst1.read("hello"))
        assertEquals("world", inst2.read("hello"))
    }
}

@RunWith(RobolectricTestRunner::class)
@Config(manifest = Config.NONE, sdk = [23, 33])
abstract class NativeStorageTestBase {

    val context: Context = ApplicationProvider.getApplicationContext()
    val defaultNamespace: String = context.packageName
    private val defaultScope: String? = null

    open val namespace: String = defaultNamespace
    open val scope: String? = defaultScope

    private lateinit var secureStorage: NativeSecureStorage
    lateinit var localStorage: NativeLocalStorage
    private lateinit var storages: List<NativeStorage>

    @Before
    fun setUp() {
        println("${javaClass.simpleName}: namespace=$namespace, scope=$scope")
        FakeAndroidKeyStore.setup
        secureStorage = NativeSecureStorage(context, namespace, scope)
        localStorage = NativeLocalStorage(context, namespace, scope)
        storages = listOf(secureStorage, localStorage)
        secureStorage.clear()
        localStorage.clear()
    }

    @Test
    fun unknownKey() {
        storages.forEach {
            assertEquals(it.read("key1"), null)
        }
    }

    @Test
    fun readWriteDelete() {
        storages.forEach { storage ->
            storage.write("key1", "value1")
            assertEquals(storage.read("key1"), "value1")

            storage.delete("key1")
            assertNull(storage.read("key1"))
        }
    }

    @Test
    fun clear() {
        storages.forEach { storage ->
            storage.write("key1", "value1")
            storage.write("key2", "value2")
            assertEquals(storage.read("key1"), "value1")
            assertEquals(storage.read("key2"), "value2")

            storage.clear()
            assertNull(storage.read("key1"))
            assertNull(storage.read("key2"))
        }
    }
}
