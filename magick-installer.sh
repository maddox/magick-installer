#!/bin/sh
set -e

function download() {
  url=$1
  base=$(basename $1)

  if [[ ! -e $base ]]; then
    echo "curling $url"
    curl -O -L $url
  fi
}

download http://nongnu.askapache.com/freetype/freetype-2.3.9.tar.gz
download http://surfnet.dl.sourceforge.net/project/libpng/libpng-stable/1.2.39/libpng-1.2.39.tar.gz
download http://www.ijg.org/files/jpegsrc.v7.tar.gz
download http://www.sfr-fresh.com/unix/misc/tiff-3.9.4.tar.gz
download http://voxel.dl.sourceforge.net/project/wvware/libwmf/0.2.8.4/libwmf-0.2.8.4.tar.gz
download http://downloads.sourceforge.net/project/lcms/lcms/1.19/lcms-1.19.tar.gz
download http://voxel.dl.sourceforge.net/project/ghostscript/GPL%20Ghostscript/8.70/ghostscript-8.70.tar.gz
download http://voxel.dl.sourceforge.net/project/gs-fonts/gs-fonts/8.11%20%28base%2035%2C%20GPL%29/ghostscript-fonts-std-8.11.tar.gz
download http://image_magick.veidrodis.com/image_magick/ImageMagick-6.6.4-0.tar.gz

tar xzvf freetype-2.3.9.tar.gz
cd freetype-2.3.9
./configure --prefix=/usr/local
make
sudo make install
cd ..

tar xzvf libpng-1.2.39.tar.gz
cd libpng-1.2.39
./configure --prefix=/usr/local
make
sudo make install
cd ..


tar xzvf jpegsrc.v7.tar.gz
cd jpeg-7
ln -s `which glibtool` ./libtool
export MACOSX_DEPLOYMENT_TARGET=10.5
./configure --enable-shared --prefix=/usr/local
make
sudo make install
cd ..


tar xzvf tiff-3.9.4.tar.gz
cd tiff-3.9.4
./configure --prefix=/usr/local
make
sudo make install
cd ..


tar xzvf libwmf-0.2.8.4.tar.gz
cd libwmf-0.2.8.4
./configure
make
sudo make install
cd ..


tar xzvf lcms-1.19.tar.gz
cd lcms-1.19
./configure
make
sudo make install
cd ..


tar zxvf ghostscript-8.70.tar.gz
cd ghostscript-8.70
./configure  --prefix=/usr/local
make
sudo make install
cd ..


tar zxvf ghostscript-fonts-std-8.11.tar.gz
sudo mv fonts /usr/local/share/ghostscript


tar xzvf ImageMagick-6.6.1-5.tar.gz
cd ImageMagick-6.6.1-5
export CPPFLAGS=-I/usr/local/include
export LDFLAGS=-L/usr/local/lib
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --with-gs-font-dir=/usr/local/share/ghostscript/fonts
make
sudo make install
cd ..
