#!/usr/bin/env bash

## Environment variables
## https://asdf-vm.com/plugins/create.html#environment-variables-overview

## General information
KC_ASDF_RES_PATH="${KC_ASDF_PLUGIN_PATH:?}/res"
KC_ASDF_ADDON_LIST=""
export KC_ASDF_RES_PATH KC_ASDF_ADDON_LIST

## ASDF directories
KC_ASDF_PLUGIN_NAME="$(basename "${KC_ASDF_PLUGIN_PATH:?}")"
KC_ASDF_CORE_PATH="${ASDF_DIR:-$(cd "$(dirname "$(dirname "${KC_ASDF_PLUGIN_PATH:?}")")" && pwd)}"
export KC_ASDF_PLUGIN_NAME KC_ASDF_CORE_PATH

## Plugin information
KC_ASDF_ORG="kc-workspace"
KC_ASDF_NAME="asdf-popeye"
KC_ASDF_REPO="https://github.com/kc-workspace/asdf-popeye"
export KC_ASDF_ORG KC_ASDF_NAME KC_ASDF_REPO

## Application information
KC_ASDF_APP_TYPE="standalone"
KC_ASDF_APP_NAME="popeye"
KC_ASDF_APP_WEBS="https://popeyecli.io"
KC_ASDF_APP_DESC="A Kubernetes cluster resource sanitizer"
KC_ASDF_APP_CMDS="
- test    - test if cli exist and executable
- version - print *plugin* version
"
KC_ASDF_APP_REPO="https://github.com/derailed/popeye"
export KC_ASDF_APP_TYPE KC_ASDF_APP_NAME
export KC_ASDF_APP_WEBS KC_ASDF_APP_DESC
export KC_ASDF_APP_CMDS KC_ASDF_APP_REPO

# shellcheck source-path=SCRIPTDIR/internal.sh
source "${KC_ASDF_PLUGIN_PATH:?}/lib/common/internal.sh" || exit 1
# shellcheck source-path=SCRIPTDIR/defaults.sh
source "${KC_ASDF_PLUGIN_PATH:?}/lib/common/defaults.sh" || exit 1
