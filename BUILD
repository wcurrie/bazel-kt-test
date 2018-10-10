load("@io_bazel_rules_kotlin//kotlin:kotlin.bzl", "kt_jvm_library", "kt_jvm_binary" , "kt_jvm_test")

java_binary(
    name = "Hi",
    srcs = glob(["src/main/java/io/x/*.java"]),
    deps = [
        "//third_party/jvm/com/google/guava",
    ]
)

kt_jvm_binary(
    name = "HiKt",
    main_class = "io.x.HiKt",
    srcs = glob(["src/main/java/io/x/Hi.kt"]),
    deps = [
        "//third_party/jvm/org/jetbrains/kotlinx:kotlinx_coroutines_core",
        "//third_party/jvm/org/jetbrains/kotlinx:kotlinx_coroutines_jdk8",
    ],
)

kt_jvm_test(
    name = "TestKt",
    srcs = glob(["src/test/java/io/x/HiTest.kt"]),
    deps = [
        "//third_party/jvm/junit:junit"
    ],
)
