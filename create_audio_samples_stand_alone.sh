#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

pushd "$BASEDIR" || exit

    if [ -d "$BASEDIR/build/audio-samples" ]; then
        printf "Pull audio-samples GitHub project"
        pushd "$BASEDIR/build/audio-samples" || exit
            git pull
        popd || exit
    else
        printf "Clone audio-samples GitHub project"
        mkdir -p build
        pushd build || exit
            git clone https://github.com/Mercandj/audio-samples.git
        popd || exit
    fi

    pushd ./build/audio-samples || exit

        bash ./create_audio_samples.sh

    popd || exit

popd || exit
