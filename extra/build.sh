#!/usr/bin/env bash
# ffmpeg windows cross compile helper extra script, see github repo README
# Copyright (C) 2023 FREE WING,Y.Sakamoto, the script is under the GPLv3, but output FFmpeg's executables aren't
# set -x

echo "Windows WSL patch"
bash ./extra/wsl_patch_2023_05_for_n4_4_x.sh
bash ./extra/wsl_patch_2023_10_for_n4_4_x.sh

FFMPEG_VER=4.4.4

echo "FFmpeg "$FFMPEG_VER" for Windows"
echo "Default: --build-ffmpeg-static=y --build-intel-qsv=y --build-amd-amf=y"
echo "Add Args: --disable-nonfree=n --ffmpeg-git-checkout-version=n"$FFMPEG_VER

# --compiler-flavors=multi,win32,win64
time ./cross_compile_ffmpeg.sh --disable-nonfree=n --ffmpeg-git-checkout-version=n"$FFMPEG_VER" --compiler-flavors=win64

