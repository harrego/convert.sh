# convert.sh
General shell scripts for converting common file formats

## Installation

Scripts can be ran directly from this directory, or scripts desired for install can be placed in `/usr/local/bin`.

## Features

- Ctrl-c compatible loops.
- Provide a single file, or convert an entire directory of relevant files.
- Only install the scripts you need, not a monolith script.

## webp2gif

Convert `.webp` files to `.gif` files.

### Requirements
- `magick` (ImageMagick)

```
webp2gif [-h] [<input gif>]

Neglecting to provide an input WebP argument will result
in conversion of all WebPs in the current working directory.
```

## webp2jpeg

Convert `.webp` files to `.jpeg` files.

### Requirements
- `magick` (ImageMagick)

```
webp2gif [-h] [<input gif>]

Neglecting to provide an input WebP argument will result
in conversion of all WebPs in the current working directory.

By default uses `-quality 85` for ImageMagick JPEG compression.
```

## flac2alac

Convert `.flac` files to ALAC `.m4a` files compatible with iTunes.

### Requirements
- ffmpeg

```
flac2alac [-h] [<input flac>]

Neglecting to provide an input FLAC argument will result
in conversion of all FLACs in the current working directory.
```

## pages2pdfs

AppleScript that batch converts `.pages` documents to `.pdf` files in a selected folder.

### Requirements
- macOS

Open the script in Script Editor on macOS and run it, select a folder containing `.pages` documents and let it convert each one.
