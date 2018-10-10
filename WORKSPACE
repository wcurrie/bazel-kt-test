load("//third_party:workspace.bzl", "maven_dependencies")
maven_dependencies()

# https://github.com/bazelbuild/rules_kotlin/pull/151
rules_kotlin_version = "69d5e5b27832050601061e1d33d041e65164867d"

http_archive(
    name = "io_bazel_rules_kotlin",
    urls = ["https://github.com/wcurrie/rules_kotlin/archive/%s.zip" % rules_kotlin_version],
    type = "zip",
    strip_prefix = "rules_kotlin-%s" % rules_kotlin_version
)

#local_repository(
#    name = "io_bazel_rules_kotlin",
#    path = "$PROJECTS/rules_kotlin",
#)

load("@io_bazel_rules_kotlin//kotlin:kotlin.bzl", "kotlin_repositories", "kt_register_toolchains")
kotlin_repositories()
kt_register_toolchains()
