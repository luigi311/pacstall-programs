# Sourced from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ffmpeg-full

pkgname="ffmpeg-full"
gives="ffmpeg"
pkgver="7.0.2"
url='https://www.ffmpeg.org/'
pkgdesc="Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac)"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
conflicts=("ffmpeg")
replaces=("ffmpeg")
license=('LicenseRef-nonfree-and-unredistributable')

source=(
  "https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
  '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
  '050-ffmpeg-fix-segfault-with-avisynthplus.patch'
  '060-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch'
  '070-ffmpeg-xeve0.5.1-support.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/3e6c7948626f19c46c1a630c788ea6bbd9e7fbcb'
  'LICENSE'
)
sha256sums=(
  '8646515b638a3ad303e23af6a3587734447cb8fc0a0c064ecdb8e95c4fd8b389'
  '59da61f2b2c556fbe0cdbf84bcc00977ee3d2447085decb21f6298226559f2aa'
  '62509a98460d3d48afcb0ce26250def7dfed124b82acc95a3b84a2802910c1fa'
  'b0ce071f0d9c7c5eff8e7e654e30c6f4377aa137797aeb54338c2c3a93d5472c'
  '4a8972bc6eae02ed9f473938b6e4d9dfa544274143dd735903073ca89633b721'
  '9c76e4c5af11afed32c588d5d900f2eaf1ca43fc2611365f661df16acde912d0'
  '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36'
)
makedepends=(
  'patchutils'
  'clang'
  'nasm'
  'amf-headers'
  'ffnvcodec-headers'
  'opencl-headers'
  'libvulkan-dev'
  #'decklink-sdk'
)
depends=(
  'alsa-lib'
  'aom'
  'aribb24'
  'avisynthplus'
  'bzip2'
  'cairo'
  'celt'
  'codec2'
  'cuda'
  'dav1d'
  'flite1'
  'fontconfig'
  'freetype2'
  'frei0r-plugins'
  'fribidi'
  'glib2'
  'glslang'
  'gmp'
  'gnutls'
  'gsm'
  'harfbuzz'
  'jack'
  'kvazaar'
  'ladspa'
  'lame'
  'libavc1394'
  'lcms2'
  'lensfun-git'
  'libass'
  'libbluray'
  'libbs2b'
  'libcaca'
  'libcdio-paranoia'
  'libdc1394'
  'libdrm'
  'libdvdnav'
  'libdvdread'
  'libfdk-aac'
  'libgcrypt'
  'libgl'
  'libgme'
  'libiec61883'
  'libilbc'
  'libjxl'
  'libmodplug'
  'libmysofa'
  'libomxil-bellagio'
  'libopenmpt'
  'libplacebo'
  'libpulse'
  'librabbitmq-c'
  'libraw1394'
  'librist'
  'librsvg'
  'libsoxr'
  'libssh'
  'libtheora'
  'libva'
  'libvdpau'
  'libvorbis'
  'libvpl'
  'libvpx'
  'libx11'
  'libxcb'
  'libxext'
  'libxml2'
  'libxv'
  'libwebp'
  'lilv'
  'lv2'
  'ocl-icd'
  'openal'
  'opencore-amr'
  'opencv2'
  'openh264'
  'openjpeg2'
  'openvino'
  'opus'
  'qrencode'
  'quirc'
  'rav1e'
  'rtmpdump'
  'rubberband'
  'sdl2'
  'smbclient'
  'snappy'
  'sndio'
  'speex'
  'spirv-tools'
  'srt'
  'svt-av1'
  'svt-hevc'
  'svt-vp9'
  'tesseract'
  'twolame'
  'v4l-utils'
  'vapoursynth'
  'vid.stab'
  'vmaf'
  'vulkan-icd-loader'
  'x264'
  'x265'
  'xvidcore'
  'xz'
  'zeromq'
  'zimg'
  'zlib'
  'zvbi'
  # aur:
  'chromaprint-fftw'
  'davs2'
  'libaribcaption'
  'libklvanc'
  'rockchip-mpp'
  'shine'
  'uavs3d-git'
  'vo-amrwbenc'
  'xavs'
  'xavs2'
  'xevd'
  'xeve'
)
optdepends=(
  'nvidia-utils: for NVIDIA NVDEC/NVENC support'
  'vpl-runtime: for Intel Quick Sync Video'
)

prepare() {
  patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
  patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-fix-segfault-with-avisynthplus.patch"
  patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch"
  patch -d "ffmpeg-${pkgver}" -Np1 -i <(filterdiff -x a/libavcodec/version.h "070-ffmpeg-xeve0.5.1-support.patch")
}

build() {
  cd "ffmpeg-${pkgver}"
  printf '%s\n' '  -> Running ffmpeg configure script...'

  export CFLAGS+=' -isystem/opt/cuda/include'
  export LDFLAGS+=' -L/opt/cuda/lib64'
  export PKG_CONFIG_PATH="/opt/intel/openvino/runtime/lib/intel64/pkgconfig${PKG_CONFIG_PATH:+":${PKG_CONFIG_PATH}"}"

  # fix build of libavfilter/asrc_flite.c with gcc 14
  export CFLAGS+=' -Wno-incompatible-pointer-types'

  ./configure \
    --prefix='/usr' \
    --enable-lto \
    \
    --disable-rpath \
    --enable-gpl \
    --enable-version3 \
    --enable-nonfree \
    --enable-shared \
    --disable-static \
    --disable-stripping \
    --disable-htmlpages \
    --enable-gray \
    \
    --enable-alsa \
    --enable-avisynth \
    --enable-bzlib \
    --enable-chromaprint \
    --enable-frei0r \
    --enable-gcrypt \
    --enable-gmp \
    --enable-gnutls \
    --enable-iconv \
    --enable-ladspa \
    --enable-lcms2 \
    --enable-libaom \
    --enable-libaribb24 \
    --enable-libaribcaption \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcelt \
    --enable-libcdio \
    --enable-libcodec2 \
    --enable-libdav1d \
    --enable-libdavs2 \
    --enable-libdc1394 \
    --enable-libdvdnav \
    --enable-libdvdread \
    --enable-libfdk-aac \
    --enable-libflite \
    --enable-libfontconfig \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libharfbuzz \
    --enable-libglslang \
    --enable-libgme \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libilbc \
    --enable-libjack \
    --enable-libjxl \
    --enable-libklvanc \
    --enable-libkvazaar \
    --enable-liblensfun \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopencv \
    --enable-libopenh264 \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopenvino \
    --enable-libopus \
    --enable-libplacebo \
    --enable-libpulse \
    --enable-libqrencode \
    --enable-libquirc \
    --enable-librabbitmq \
    --enable-librav1e \
    --enable-librist \
    --enable-librsvg \
    --enable-librubberband \
    --enable-librtmp \
    --disable-libshaderc \
    --enable-libshine \
    --enable-libsmbclient \
    --enable-libsnappy \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libssh \
    --enable-libsvtav1 \
    --disable-libtensorflow \
    --enable-libtesseract \
    --enable-libtheora \
    --disable-libtls \
    --disable-libtorch \
    --enable-libtwolame \
    --enable-libuavs3d \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvmaf \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxevd \
    --enable-libxeve \
    --enable-libxavs \
    --enable-libxavs2 \
    --enable-libxcb \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxcb-shape \
    --enable-libxvid \
    --enable-libxml2 \
    --enable-libzimg \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-lv2 \
    --enable-lzma \
    \
    --disable-mbedtls \
    --enable-libmysofa \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --disable-openssl \
    --disable-pocketsphinx \
    --enable-sndio \
    --enable-sdl2 \
    --enable-vapoursynth \
    --enable-vulkan \
    --enable-xlib \
    --enable-zlib \
    \
    --enable-amf \
    --enable-cuda-nvcc \
    --enable-cuda-llvm \
    --enable-cuvid \
    --enable-ffnvcodec \
    --enable-libdrm \
    --enable-libvpl \
    --enable-libnpp \
    --enable-nvdec \
    --enable-nvenc \
    --enable-omx \
    --enable-rkmpp \
    --enable-v4l2-m2m \
    --enable-vaapi \
    --enable-vdpau
  make
  make tools/qt-faststart
}

package() {
  make -C "ffmpeg-${pkgver}" DESTDIR="${pkgdir}" install
  install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
