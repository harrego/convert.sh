# convert.sh
General shell scripts for converting common file formats

## Installation

Scripts can be ran directly from this directory, or scripts desired for install can be placed in `/usr/local/bin`.

## webp2gif

Convert `.webp` files to `.gif` files.

### Requirements
* `magick` (ImageMagick)

```
webp2gif [-h] [<input gif>]

Neglecting to provide an input WebP argument will result
in conversion of all WebPs in the current working directory.
```

## flac2alac

Convert `.flac` files to ALAC `.m4a` files compatible with iTunes.

### Requirements
* ffmpeg

```
flac2alac [-h] [<input flac>]

Neglecting to provide an input FLAC argument will result
in conversion of all FLACs in the current working directory.
```
