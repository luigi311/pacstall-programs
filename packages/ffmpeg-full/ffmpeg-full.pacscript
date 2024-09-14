# Sourced from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ffmpeg-full

pkgname="ffmpeg-full"
gives="ffmpeg"
pkgver="7.0.2"
url='https://www.ffmpeg.org/'
pkgdesc="Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac)"
maintainer=("Luis Garcia <pacstall@luigi311.com>")
conflicts=("ffmpeg")
replaces=("ffmpeg")
license=()

source=(
  "https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
  #'040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
  #'050-ffmpeg-fix-segfault-with-avisynthplus.patch'
  #'060-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch'
  #'070-ffmpeg-xeve0.5.1-support.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/3e6c7948626f19c46c1a630c788ea6bbd9e7fbcb'
  #'LICENSE'
)
sha256sums=(
  '8646515b638a3ad303e23af6a3587734447cb8fc0a0c064ecdb8e95c4fd8b389'
  #'59da61f2b2c556fbe0cdbf84bcc00977ee3d2447085decb21f6298226559f2aa'
  #'62509a98460d3d48afcb0ce26250def7dfed124b82acc95a3b84a2802910c1fa'
  #'b0ce071f0d9c7c5eff8e7e654e30c6f4377aa137797aeb54338c2c3a93d5472c'
  #'4a8972bc6eae02ed9f473938b6e4d9dfa544274143dd735903073ca89633b721'
  #'9c76e4c5af11afed32c588d5d900f2eaf1ca43fc2611365f661df16acde912d0'
  #'04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36'
)
pacdeps=(
  'amf-headers'
  'ffnvcodec-headers'
)
makedepends=(
  'patchutils'
  'clang'
  'nasm'
  'opencl-headers'
  'zlib1g-dev'
  'libalut-dev'
  'libaom-dev'
  'libarchive-dev'
  'libass-dev'
  'libasound2-dev'
  'libaribb24-dev'
  'libavc1394-dev'
  'libbluray-dev'
  'libbs2b-dev'
  'libcaca-dev'
  'libcairo2-dev'
  'libcdio-paranoia-dev'
  'libchromaprint-dev'
  'libcodec2-dev'
  'libdav1d-dev'
  'libdavs2-dev'
  'libdc1394-dev'
  'libdrm-dev'
  'libdvdnav-dev'
  'libdvdread-dev'
  'libfdk-aac-dev'
  'libfontconfig-dev'
  'libfreetype-dev'
  'libfribidi-dev'
  'libgcrypt-dev'
  'libgl-dev'
  'libglib2.0-dev'
  'libgme-dev'
  'libgmp3-dev'
  'libgnutls28-dev'
  'libgsm1-dev'
  'libharfbuzz-dev'
  'libiec61883-dev'
  #'libilbc-dev' # In noble only
  #'libjxl-dev' # In noble only
  'libjack-dev'
  'liblcms2-dev'
  'liblensfun-dev'
  'liblilv-dev'
  'liblzma-dev'
  'libmodplug-dev'
  'libmp3lame-dev'
  'libmysofa-dev'
  'libomxil-bellagio-dev'
  'libopus-dev'
  'libopencore-amrnb-dev'
  'libopencore-amrwb-dev'
  'libopenh264-dev'
  'libopenmpt-dev'
  'libopenjp2-7-dev'
  'libplacebo-dev'
  'libpulse-dev'
  'libqrencode-dev'
  'librabbitmq-dev'
  'libraw1394-dev'
  'librsvg2-dev'
  'librtmp-dev'
  'librubberband-dev'
  'libsdl2-dev'
  'libshine-dev'
  'libsmbclient-dev'
  'libsnappy-dev'
  'libsndio-dev'
  'libsoxr-dev'
  'libspeex-dev'
  'libsrt-openssl-dev'
  'libssh-dev'
  'libsvtav1-dev'
  'libtesseract-dev'
  'libtheora-dev'
  'libtwolame-dev'
  'libva-dev'
  'libvidstab-dev'
  'libvdpau-dev'
  'libvorbis-dev'
  'libvpl-dev'
  'libvpx-dev'
  'libx11-dev'
  'libx264-dev'
  'libx265-dev'
  'libxavs2-dev'
  'libxcb1-dev'
  'libxext-dev'
  'libxml2-dev'
  'libxv-dev'
  'libxvidcore-dev'
  'libwebp-dev'
  'libvo-amrwbenc-dev'
  'libvulkan-dev'
  'libzimg-dev'
  'libzvbi-dev'
  'lv2-dev'
  'flite1-dev'
  'frei0r-plugins-dev'
  'glslang-dev'
  'nvidia-cuda-dev'
  'ocl-icd-opencl-dev'
)
depends=(
  #'avisynthplus'
  #'celt'
  #'kvazaar'
  #'ladspa'
  #'librist'
  #'opencv2'
  #'openvino'
  #'quirc'
  #'rav1e'
  #'spirv-tools'
  #'v4l-utils'
  #'vapoursynth'
  #'vmaf'
  #'vulkan-icd-loader'
  #'zeromq'
  #'libaribcaption'
  #'libklvanc'
  #'rockchip-mpp'
  #'uavs3d-git'
  #'xevd'
  #'xeve'
)
optdepends=(
  'nvidia-utils: for NVIDIA NVDEC/NVENC support'
  #'vpl-runtime: for Intel Quick Sync Video'
)

#prepare() {
#patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
#patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-fix-segfault-with-avisynthplus.patch"
#patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch"
#patch -d "ffmpeg-${pkgver}" -Np1 -i <(filterdiff -x a/libavcodec/version.h "070-ffmpeg-xeve0.5.1-support.patch")
#}

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
