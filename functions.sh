#!/usr/bin/env bash

jdk() {
      version=$1;
      unset JAVA_HOME;
      JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      export JAVA_HOME;
      java -version;
}

# vscode own terminal integration will always open an additional app icon in the dock "recently opened"
# https://github.com/microsoft/vscode/issues/60579
# this fixes the issue (shellcheck suggests the alias solution should be omitted https://github.com/koalaman/shellcheck/wiki/SC2142)
code() {  open -b com.microsoft.VSCode "$@"; }
