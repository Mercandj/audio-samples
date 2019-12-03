#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

pushd "$BASEDIR" || exit

    pushd ./build || exit

        rm *.aac
        rm *.aif
        rm *.aiff
        rm *.ape
        rm *.mp3
        rm *.mp4
        rm *.m4a
        rm *.ogg
        rm *.opus
        rm *.ra
        rm *.wav
        rm *.wma

    popd || exit

    rm -f ./build

popd || exit
