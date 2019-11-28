#!/usr/bin/env bash

# Here a way to check file metadata https://www.get-metadata.com/

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

pushd "$BASEDIR" || exit

    bash ./clean_files.sh

    mkdir ./build

    # https://github.com/Mercandj/audio-samples/issues/2
    ffmpeg -i ./sample_bee_moved_96_khz.flac -acodec pcm_s16le ./build/sample_bee_moved_96_khz.wav

    # https://github.com/Mercandj/audio-samples/issues/1
    ffmpeg -i ./sample_bee_moved_96_khz.flac -c:a libmp3lame -ar 44100 -ab 320k -map_metadata 0 -id3v2_version 3 ./build/sample_bee_moved_44100_khz.mp3

    # https://github.com/Mercandj/audio-samples/issues/1
    ffmpeg -i ./sample_bee_moved_96_khz.flac -c:a libmp3lame -ar 48000 -ab 320k -map_metadata 0 -id3v2_version 3 ./build/sample_bee_moved_48000_khz.mp3

    # https://superuser.com/questions/684955/converting-audio-to-aac-using-ffmpeg
    ffmpeg -i ./build/sample_bee_moved_96_khz.wav -codec:a aac ./build/sample_bee_moved_aac.m4a

    # https://superuser.com/questions/684955/converting-audio-to-aac-using-ffmpeg
    ffmpeg -i ./build/sample_bee_moved_aac.m4a -c:a copy ./build/sample_bee_moved_aac.aac

    ffmpeg -i ./build/sample_bee_moved_44100_khz.mp3 ./build/sample_bee_moved_44100_khz.wma

    ffmpeg -i ./build/sample_bee_moved_48000_khz.mp3 ./build/sample_bee_moved_48000_khz.wma

    ffmpeg -i ./build/sample_bee_moved_96_khz.wav -acodec libvorbis ./build/sample_bee_moved_vorbis.ogg

    ffmpeg -i ./build/sample_bee_moved_96_khz.wav -acodec libopus ./build/sample_bee_moved.opus

    printf "\n\n\n"
    printf "Checkout $BASEDIR/generated_content_description.json to find output file\n"

popd || exit
