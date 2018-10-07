Regenerating workspace.bzl from maven dependencies in dependencies.yaml

    ../bazel-deps/gen_maven_deps.sh generate --repo-root $PWD --sha-file third_party/workspace.bzl --deps dependencies.yaml

Rebuild bazel-deps with

    bazel build src/scala/com/github/johnynek/bazel_deps/parseproject_deploy.jar
