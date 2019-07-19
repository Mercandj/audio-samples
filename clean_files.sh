#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

pushd "$BASEDIR"

    pushd ./build

        rm *.aac
        rm *.mp3
        rm *.m4a
        rm *.ogg
        rm *.wav

    popd

    rm -f ./build

popd
