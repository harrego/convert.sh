#!/bin/sh

if [ "$1" = "-h" ]
then
    echo "flac2alac [-h] [<input flac>]"
    echo ""
    echo "Neglecting to provide an input FLAC argument will result"
    echo "in conversion of all FLACs in the current working directory."
    echo ""
    echo "This script requires ffmpeg in PATH."
    exit
fi

if [ -z "$(command -v ffmpeg)" ]
then
    echo "Error: this script requires ffmpeg"
    exit 1
fi

if [ -z "$1" ]
then
    SONG="$i"
    ffmpeg -i "$SONG" -c:a alac -c:v copy -sample_fmt s16p -ar 44100 "${SONG%.*}.m4a"
else
    for i in *.flac; do ffmpeg -i "$i" -c:a alac -c:v copy -sample_fmt s16p -ar 44100 "${i%.*}.m4a"; done
fi
