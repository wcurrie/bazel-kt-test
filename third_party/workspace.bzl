# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
        "lang": attr.string(mandatory = True),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256,
        lang = hash["lang"]
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.google.code.findbugs:jsr305:1.3.9", "lang": "java", "sha1": "40719ea6961c0cb6afaeb6a921eaa1f6afd4cfdf", "sha256": "905721a0eea90a81534abb7ee6ef4ea2e5e645fa1def0a5cd88402df1b46c9ed", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/1.3.9/jsr305-1.3.9.jar", "name": "com_google_code_findbugs_jsr305", "actual": "@com_google_code_findbugs_jsr305//jar", "bind": "jar/com/google/code/findbugs/jsr305"},
    {"artifact": "com.google.errorprone:error_prone_annotations:2.0.12", "lang": "java", "sha1": "8530d22d4ae8419e799d5a5234e0d2c0dcf15d4b", "sha256": "7e9c688f734ee5cf2386d3efc367d4a3e6d09130d2afeb52434e1cc2880820a4", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.0.12/error_prone_annotations-2.0.12.jar", "source": {"sha1": "90cff054bd2754d6597cbd7f0e4ac1ab3e381f20", "sha256": "3e8fd6df244654c8b7a07b80958b0417e27ddf5f5e73a07ccff701047d3acfde", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.0.12/error_prone_annotations-2.0.12-sources.jar"} , "name": "com_google_errorprone_error_prone_annotations", "actual": "@com_google_errorprone_error_prone_annotations//jar", "bind": "jar/com/google/errorprone/error_prone_annotations"},
    {"artifact": "com.google.guava:guava-testlib:20.0", "lang": "java", "sha1": "e3666edd0d7b10ddfa5242b998efd831e4b264ff", "sha256": "a9f52f328ac024e420c8995a107ea0dbef3fc169ddf97b3426e634f28d6b3663", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava-testlib/20.0/guava-testlib-20.0.jar", "source": {"sha1": "0b2f6057ad568145bc9cfd3af696cbeb1dc46da0", "sha256": "cea10fded3f2ec85a22f4b1d0091053299d1488cf7c841e87740e68ff5ef4d1f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava-testlib/20.0/guava-testlib-20.0-sources.jar"} , "name": "com_google_guava_guava_testlib", "actual": "@com_google_guava_guava_testlib//jar", "bind": "jar/com/google/guava/guava_testlib"},
    {"artifact": "com.google.guava:guava:20.0", "lang": "java", "sha1": "89507701249388e1ed5ddcf8c41f4ce1be7831ef", "sha256": "36a666e3b71ae7f0f0dca23654b67e086e6c93d192f60ba5dfd5519db6c288c8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/20.0/guava-20.0.jar", "source": {"sha1": "9c8493c7991464839b612d7547d6c263adf08f75", "sha256": "994be5933199a98e98bd09584da2bb69ed722275f6bed61d83459af88ace5cbd", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/20.0/guava-20.0-sources.jar"} , "name": "com_google_guava_guava", "actual": "@com_google_guava_guava//jar", "bind": "jar/com/google/guava/guava"},
    {"artifact": "junit:junit:4.12", "lang": "java", "sha1": "2973d150c0dc1fefe998f834810d68f278ea58ec", "sha256": "59721f0805e223d84b90677887d9ff567dc534d7c502ca903c0c2b17f05c116a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/junit/junit/4.12/junit-4.12.jar", "source": {"sha1": "a6c32b40bf3d76eca54e3c601e5d1470c86fcdfa", "sha256": "9f43fea92033ad82bcad2ae44cec5c82abc9d6ee4b095cab921d11ead98bf2ff", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/junit/junit/4.12/junit-4.12-sources.jar"} , "name": "junit_junit", "actual": "@junit_junit//jar", "bind": "jar/junit/junit"},
    {"artifact": "org.hamcrest:hamcrest-core:1.3", "lang": "java", "sha1": "42a25dc3219429f0e5d060061f71acb49bf010a0", "sha256": "66fdef91e9739348df7a096aa384a5685f4e875584cce89386a7a47251c4d8e9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar", "source": {"sha1": "1dc37250fbc78e23a65a67fbbaf71d2e9cbc3c0b", "sha256": "e223d2d8fbafd66057a8848cc94222d63c3cedd652cc48eddc0ab5c39c0f84df", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3-sources.jar"} , "name": "org_hamcrest_hamcrest_core", "actual": "@org_hamcrest_hamcrest_core//jar", "bind": "jar/org/hamcrest/hamcrest_core"},
    {"artifact": "org.jetbrains.kotlin:kotlin-stdlib:1.2.70", "lang": "java", "sha1": "b5b9449f73ce7bf312e89a7560cb3c209a0fa13e", "sha256": "7d20d0a56dd0ea6176137759a6aad331bbfae67436b45e5f0a4d8dafb6985c81", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlin/kotlin-stdlib/1.2.70/kotlin-stdlib-1.2.70.jar", "source": {"sha1": "645811a161689d7b2d4362eaee1e30abf22a27d7", "sha256": "63c4e703f0b427c9f081a1877926c171283d07c17e9077b3493c068082c0bf82", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlin/kotlin-stdlib/1.2.70/kotlin-stdlib-1.2.70-sources.jar"} , "name": "org_jetbrains_kotlin_kotlin_stdlib", "actual": "@org_jetbrains_kotlin_kotlin_stdlib//jar:file", "bind": "jar/org/jetbrains/kotlin/kotlin_stdlib"},
    {"artifact": "org.jetbrains.kotlinx:atomicfu-common:0.11.10", "lang": "java", "sha1": "b77c47045af8f0eb4628b7ffa3b179b333f94baf", "sha256": "68392cc1ca9d193336d0cb695e8be41af432260a71a408e6ef8497bd1a10a126", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/atomicfu-common/0.11.10/atomicfu-common-0.11.10.jar", "source": {"sha1": "db08a73440e0a619deecbbb256b8ebc8036592fb", "sha256": "4c91fbb6f0adeea54e3117d2b5d0f7cfed5b23d10aa968dd6b67ef4989037078", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/atomicfu-common/0.11.10/atomicfu-common-0.11.10-sources.jar"} , "name": "org_jetbrains_kotlinx_atomicfu_common", "actual": "@org_jetbrains_kotlinx_atomicfu_common//jar:file", "bind": "jar/org/jetbrains/kotlinx/atomicfu_common"},
    {"artifact": "org.jetbrains.kotlinx:kotlinx-coroutines-core-common:0.30.1", "lang": "java", "sha1": "e5aca39b26ff9ed62d76232167607a9e6e041990", "sha256": "e2d4ee0350a4be8e58afa95f7331138aa736cd603b5908d57761295eb1f4b5a5", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-core-common/0.30.1/kotlinx-coroutines-core-common-0.30.1.jar", "source": {"sha1": "bf5dd5fe6d1c12344eff11479867cbd85b1b90eb", "sha256": "29b305432bedd1614f894de6daffb5fc40e2146686a81f3a79ddd731256a371a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-core-common/0.30.1/kotlinx-coroutines-core-common-0.30.1-sources.jar"} , "name": "org_jetbrains_kotlinx_kotlinx_coroutines_core_common", "actual": "@org_jetbrains_kotlinx_kotlinx_coroutines_core_common//jar:file", "bind": "jar/org/jetbrains/kotlinx/kotlinx_coroutines_core_common"},
    {"artifact": "org.jetbrains.kotlinx:kotlinx-coroutines-core:0.30.1", "lang": "java", "sha1": "78779c75434b7c6638daea4179703d8727ea02d8", "sha256": "9d1f5a72f29bd0e53c03ad9c5deee76a9279caa8bf2876a8d6d863105541f302", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-core/0.30.1/kotlinx-coroutines-core-0.30.1.jar", "source": {"sha1": "6998fee8385e5d33e1b4b729f6633bdbf1b42d6a", "sha256": "5c24e95f552bfb7aa29ea1b8fb0cf5faffbfe353e1afae841a4dcb1a57e36b8a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-core/0.30.1/kotlinx-coroutines-core-0.30.1-sources.jar"} , "name": "org_jetbrains_kotlinx_kotlinx_coroutines_core", "actual": "@org_jetbrains_kotlinx_kotlinx_coroutines_core//jar:file", "bind": "jar/org/jetbrains/kotlinx/kotlinx_coroutines_core"},
    {"artifact": "org.jetbrains.kotlinx:kotlinx-coroutines-jdk8:0.30.1", "lang": "java", "sha1": "4e30010a05ac8cb08400dc648600cc0945a1ed1a", "sha256": "5eb48dedaf6a0258a368e0c5648191b4a68634d3ee8dedb93b3031f3ea09228b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-jdk8/0.30.1/kotlinx-coroutines-jdk8-0.30.1.jar", "source": {"sha1": "3bba44187873cb7b71eacaf7d76479a816f2aee3", "sha256": "c0b4ee9907e6aa91038798c20180ea107b0a2215b9170eb7b21459c49eec683e", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-jdk8/0.30.1/kotlinx-coroutines-jdk8-0.30.1-sources.jar"} , "name": "org_jetbrains_kotlinx_kotlinx_coroutines_jdk8", "actual": "@org_jetbrains_kotlinx_kotlinx_coroutines_jdk8//jar:file", "bind": "jar/org/jetbrains/kotlinx/kotlinx_coroutines_jdk8"},
    {"artifact": "org.jetbrains:annotations:13.0", "lang": "java", "sha1": "919f0dfe192fb4e063e7dacadee7f8bb9a2672a9", "sha256": "ace2a10dc8e2d5fd34925ecac03e4988b2c0f851650c94b8cef49ba1bd111478", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/annotations/13.0/annotations-13.0.jar", "source": {"sha1": "5991ca87ef1fb5544943d9abc5a9a37583fabe03", "sha256": "42a5e144b8e81d50d6913d1007b695e62e614705268d8cf9f13dbdc478c2c68e", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/jetbrains/annotations/13.0/annotations-13.0-sources.jar"} , "name": "org_jetbrains_annotations", "actual": "@org_jetbrains_annotations//jar", "bind": "jar/org/jetbrains/annotations"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
