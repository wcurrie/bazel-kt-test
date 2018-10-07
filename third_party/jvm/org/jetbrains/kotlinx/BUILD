java_library(
    name = "atomicfu_common",
    exports = [
        "//external:jar/org/jetbrains/kotlinx/atomicfu_common"
    ],
    licenses = [
        "notice"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "kotlinx_coroutines_core",
    exports = [
        "//external:jar/org/jetbrains/kotlinx/kotlinx_coroutines_core",
        "//third_party/jvm/org/jetbrains/kotlin:kotlin_stdlib",
        ":kotlinx_coroutines_core_common"
    ],
    licenses = [
        "notice"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "kotlinx_coroutines_core_common",
    exports = [
        "//external:jar/org/jetbrains/kotlinx/kotlinx_coroutines_core_common",
        ":atomicfu_common"
    ],
    licenses = [
        "notice"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "kotlinx_coroutines_jdk8",
    exports = [
        "//external:jar/org/jetbrains/kotlinx/kotlinx_coroutines_jdk8",
        "//third_party/jvm/org/jetbrains/kotlin:kotlin_stdlib",
        ":kotlinx_coroutines_core"
    ],
    licenses = [
        "notice"
    ],
    visibility = [
        "//visibility:public"
    ]
)


