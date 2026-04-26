import kotlinx.cinterop.*
import kotlin.experimental.ExperimentalNativeApi
import kotlin.native.CName

@OptIn(ExperimentalNativeApi::class)
@CName("print_w8")
fun printW8() {
    platform.posix.printf("w")
}
