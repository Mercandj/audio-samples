#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

pushd "$BASEDIR"

    if [ -d "$BASEDIR/build/audio-samples" ]; then
        printf "Pull audio-samples GitHub project"
        pushd "$BASEDIR/build/audio-samples"
            git pull
        popd
    else
        printf "Clone audio-samples GitHub project"
        mkdir -p build
        pushd build
            git clone https://github.com/Mercandj/audio-samples.git
        popd
    fi

    pushd ./build/audio-samples

        bash ./create_audio_samples.sh

    popd

popd
