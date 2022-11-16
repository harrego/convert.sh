# convert.sh
General shell scripts for converting common file formats

## Installation

Scripts can be ran directly from this directory, or scripts desired for install can be placed in `/usr/local/bin`.

## flac2alac

### Requirements
* ffmpeg

```
flac2alac [-h] [<input flac>]

Neglecting to provide an input FLAC argument will result
in conversion of all FLACs in the current working directory.
```
