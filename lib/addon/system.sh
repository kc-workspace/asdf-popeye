#!/usr/bin/env bash

## Get current OS name
## usage: `kc_asdf_get_os`
## variable:
##   - ASDF_OVERRIDE_OS for override arch
kc_asdf_get_os() {
  local ns="os.addon"
  local os="${ASDF_OVERRIDE_OS:-}"
  if [ -n "$os" ]; then
    kc_asdf_warn "$ns" "user overriding OS to '%s'" "$os"
    printf "%s" "$os"
    return 0
  fi

  os="$(uname | tr '[:upper:]' '[:lower:]')"

  if command -v _kc_asdf_custom_os >/dev/null; then
    local tmp="$os"
    os="$(_kc_asdf_custom_os "$tmp")"
    kc_asdf_debug "$ns" "developer has custom OS name from %s to %s" "$tmp" "$os"
  fi

  printf "%s" "$os"
}

## Is current OS is macOS
## usage: `kc_asdf_is_darwin`
kc_asdf_is_darwin() {
  local ns="os.addon"
  local os custom=""
  os="$(kc_asdf_get_os)"
  local darwin="${custom:-darwin}"
  kc_asdf_debug "$ns" "checking current os (%s) should be %s" "$os" "$darwin"
  [[ "$os" == "$darwin" ]]
}

## Is current OS is LinuxOS
## usage: `kc_asdf_is_linux`
kc_asdf_is_linux() {
  local ns="os.addon"
  local os custom=""
  os="$(kc_asdf_get_os)"
  local linux="${custom:-linux}"
  kc_asdf_debug "$ns" "checking current os (%s) should be %s" "$os" "$linux"
  [[ "$os" == "$linux" ]]
}

## Get current Arch name
## usage: `kc_asdf_get_arch`
## variable:
##   - ASDF_OVERRIDE_ARCH for override arch
kc_asdf_get_arch() {
  local ns="arch.addon"
  local arch="${ASDF_OVERRIDE_ARCH:-}"
  if [ -n "$arch" ]; then
    kc_asdf_warn "$ns" "user overriding arch to '%s'" "$arch"
  else
    arch="$(uname -m)"
  fi
  case "$arch" in
  aarch64*)
    arch="arm64"
    ;;
  armv5*)
    arch="armv7"
    ;;
  armv6*)
    arch="armv7"
    ;;
  armv7*)
    arch="armv7"
    ;;
  i386)
    arch="s390"
    ;;
  i686)
    arch="s390"
    ;;
  powerpc64le)
    arch="ppc64le"
    ;;
  ppc64le)
    arch="ppc64le"
    ;;
  x86_64)
    arch="amd64"
    ;;
  esac

  if command -v _kc_asdf_custom_arch >/dev/null; then
    local tmp="$arch"
    arch="$(_kc_asdf_custom_arch "$tmp")"
    kc_asdf_debug "$ns" "developer has custom ARCH name from %s to %s" "$tmp" "$arch"
  fi

  printf "%s" "$arch"
}

## System information
KC_ASDF_OS="$(kc_asdf_get_os)"
KC_ASDF_ARCH="$(kc_asdf_get_arch)"
export KC_ASDF_OS KC_ASDF_ARCH
