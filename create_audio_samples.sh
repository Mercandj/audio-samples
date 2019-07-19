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

        bash ./clean_files.sh

        mkdir ./build

        ffmpeg -i ./sample_bee_moved_96_khz_24_bit.flac ./build/sample_bee_moved_96_khz_24_bit.wav

        # https://stackoverflow.com/questions/26109837/convert-flac-to-mp3-with-ffmpeg-keeping-all-metadata
        ffmpeg -i ./sample_bee_moved_96_khz_24_bit.flac -ab 320k -map_metadata 0 -id3v2_version 3 ./build/sample_bee_moved_48_khz.mp3

        ffmpeg -i ./build/sample_bee_moved_96_khz_24_bit.wav -codec:a aac ./build/sample_bee_moved_aac.m4a

        ffmpeg -i ./build/sample_bee_moved_96_khz_24_bit.wav -acodec libvorbis ./build/sample_bee_moved_vorbis.ogg

    popd

    printf "\n\n\n"
    printf "Checkout $BASEDIR/build/audio-samples/generated_content_description.json to find output file\n"

popd
