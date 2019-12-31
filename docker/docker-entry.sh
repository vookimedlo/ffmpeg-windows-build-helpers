#!/bin/bash

# docker actually runs this as a script after having copied it in as part of the "big initial copy" making the image...

set -e

readonly FFMPEG_VERSION=n4.2.1
OUTPUTDIR=/output

./cross_compile_ffmpeg.sh --build-ffmpeg-shared=y --build-ffmpeg-static=y --disable-nonfree=n --build-intel-qsv=y --compiler-flavors=win64 --enable-gpl=y --high-bitdepth=n --ffmpeg-git-checkout-version=${FFMPEG_VERSION} --build-amd-amf=n

mkdir -p $OUTPUTDIR/static/bin
cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_${FFMPEG_VERSION}/ffmpeg.exe $OUTPUTDIR/static/bin
cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_${FFMPEG_VERSION}/ffprobe.exe $OUTPUTDIR/static/bin
cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_${FFMPEG_VERSION}/ffplay.exe $OUTPUTDIR/static/bin

mkdir -p $OUTPUTDIR/shared
cp -R -f ./sandbox/win64/ffmpeg_git_with_fdk_aac_${FFMPEG_VERSION}_shared/bin/ $OUTPUTDIR/shared

if [[ -f /tmp/loop ]]; then
  echo 'sleeping forever so you can attach to this docker if desired' # without this if there's a build failure the docker exits and can't get in to tweak stuff??? :|
  sleep
fi
