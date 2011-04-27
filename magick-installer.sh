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

download http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.1.tar.gz
download http://nongnu.askapache.com/freetype/freetype-2.4.3.tar.gz
download ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng-1.5.2.tar.gz
download http://www.ijg.org/files/jpegsrc.v8b.tar.gz
download http://download.osgeo.org/libtiff/tiff-3.9.4.tar.gz
download http://voxel.dl.sourceforge.net/project/wvware/libwmf/0.2.8.4/libwmf-0.2.8.4.tar.gz
download http://downloads.sourceforge.net/project/lcms/lcms/1.19/lcms-1.19.tar.gz
download http://heanet.dl.sourceforge.net/project/ghostscript/GPL%20Ghostscript/9.00/ghostscript-9.00.tar.gz
download http://voxel.dl.sourceforge.net/project/gs-fonts/gs-fonts/8.11%20%28base%2035%2C%20GPL%29/ghostscript-fonts-std-8.11.tar.gz
download ftp://ftp.sunet.se/pub/multimedia/graphics/ImageMagick/ImageMagick-6.6.7-0.tar.gz


tar xzvf libiconv-1.13.1.tar.gz
cd tar xzvf libiconv-1.13.1.tar.gz
cd libiconv-1.13.1
./configure --prefix=/usr/local
make
sudo make install
cd ..

tar xzvf freetype-2.4.3.tar.gz
cd freetype-2.4.3
./configure --prefix=/usr/local
make clean
make
sudo make install
cd ..

tar xzvf libpng-1.5.2.tar.gz
cd libpng-1.5.2
./configure --prefix=/usr/local
make clean
make
sudo make install
cd ..


tar xzvf jpegsrc.v8b.tar.gz
cd jpeg-8b
ln -s -f `which glibtool` ./libtool 
export MACOSX_DEPLOYMENT_TARGET=10.6
./configure --enable-shared --prefix=/usr/local
make clean
make
sudo make install
cd ..


tar xzvf tiff-3.9.4.tar.gz
cd tiff-3.9.4
./configure --prefix=/usr/local
make clean
make
sudo make install
cd ..


tar xzvf libwmf-0.2.8.4.tar.gz
cd libwmf-0.2.8.4
./configure
make clean
make
sudo make install
cd ..


tar xzvf lcms-1.19.tar.gz
cd lcms-1.19
./configure
make clean
make
sudo make install
cd ..


tar zxvf ghostscript-9.00.tar.gz
cd ghostscript-9.00
./configure  --prefix=/usr/local
make clean
make
sudo make install
cd ..


tar zxvf ghostscript-fonts-std-8.11.tar.gz
sudo mkdir -p /usr/local/share/ghostscript/fonts
sudo mv -f fonts/* /usr/local/share/ghostscript/fonts


tar xzvf ImageMagick-6.6.7-0.tar.gz
cd ImageMagick-6.6.7-0
export CPPFLAGS=-I/usr/local/include
export LDFLAGS=-L/usr/local/lib
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --with-gs-font-dir=/usr/local/share/ghostscript/fonts --disable-openmp
make clean
make
sudo make install
cd ..
