#!/bin/sh

# flac2alac.sh
#
# convert.sh
# https://github.com/harrego/convert.sh

# MIT License
# 
# Copyright (c) 2022 Harry Stanton
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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

if [ ! -z "$1" ]
then
    SONG="$1"
    ffmpeg -i "$SONG" -c:a alac -c:v copy -sample_fmt s16p -ar 44100 "${SONG%.*}.m4a"
else
	FILES=false
	set -- *.flac
	case $1 in
		("*.flac") FILES=false ;;
		(*) FILES=true ;;
	esac
	
	if [ "$FILES" = false ]
	then
		echo "Error: no matching .flac files"
		exit 1
	fi

    for i in *.flac
    do
        ffmpeg -i "$i" -y -c:a alac -c:v copy -sample_fmt s16p -ar 44100 "${i%.*}.m4a" || break
    done
fi
