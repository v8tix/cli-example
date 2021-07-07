#!/usr/bin/env bash
dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
. ""${dir}"/lib_cowsay.sh"

cowsay_wrapper -msg "$1"