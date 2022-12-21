#!/bin/sh

# webp2jpeg.sh
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
    echo "webp2jpeg [-h] [<input jpeg>]"
    echo ""
    echo "Neglecting to provide an input WebP argument will result"
    echo "in conversion of all WebPs in the current working directory."
    echo ""
    echo "By default uses \`-quality 85\` for ImageMagick JPEG compression."
    echo ""
    echo "This script requires magick (ImageMagick) in PATH."
    exit
fi

if [ -z "$(command -v magick)" ]
then
    echo "Error: this script requires magick (ImageMagick). If you"
    echo "believe that you already have ImageMagick, try updating"
    echo "to a newer ImageMagick version that bundles the \"magick\""
    echo "tool."
    exit 1
fi

if [ ! -z "$1" ]
then
    IMG="$1"
    magick "$IMG" "${IMG%.*}.jpeg"
else
	FILES=false
	set -- *.webp
	case $1 in
		("*.webp") FILES=false ;;
		(*) FILES=true ;;
	esac
	
	if [ "$FILES" = false ]
	then
		echo "Error: no matching .webp files"
		exit 1
	fi

    for i in *.webp
    do
        magick  "$i" -quality 85 "${i%.*}.jpeg" || break
    done
fi
