#!/bin/bash

# docker actually runs this as a script after having copied it in as part of the "big initial copy" making the image...

set -e

readonly ffmpeg_version=n5.0.1

OUTPUTDIR=/output

./cross_compile_ffmpeg.sh --ffmpeg-git-checkout-version=$ffmpeg_version --build-amd-amf=n --build-ffmpeg-static=y --disable-nonfree=n --compiler-flavors=win64 --enable-gpl=y

mkdir -p $OUTPUTDIR/static/bin
cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_$ffmpeg_version/ffmpeg.exe $OUTPUTDIR/static/bin
cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_$ffmpeg_version/ffprobe.exe $OUTPUTDIR/static/bin
cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_$ffmpeg_version/ffplay.exe $OUTPUTDIR/static/bin

#mkdir -p $OUTPUTDIR/shared
#cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_shared/bin/ $OUTPUTDIR/shared

#if [[ -f /tmp/loop ]]; then
#  echo 'sleeping forever so you can attach to this docker if desired' # without this if there's a build failure the docker exits and can't get in to tweak stuff??? :|
#  sleep
#fi
