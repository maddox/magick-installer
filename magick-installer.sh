#!/bin/sh
curl -O http://download.savannah.gnu.org/releases/freetype/freetype-2.3.5.tar.gz
tar xzvf freetype-2.3.5.tar.gz
cd freetype-2.3.5
./configure --prefix=/usr/local
make
sudo make install
cd ..

curl -O http://superb-east.dl.sourceforge.net/sourceforge/libpng/libpng-1.2.23.tar.bz2
tar jxvf libpng-1.2.23.tar.bz2
cd libpng-1.2.23
./configure --prefix=/usr/local
make
sudo make install
cd ..

curl -O http://www.ijg.org/files/jpegsrc.v6b.tar.gz
tar xzvf jpegsrc.v6b.tar.gz
cd jpeg-6b
ln -s `which glibtool` ./libtool
export MACOSX_DEPLOYMENT_TARGET=10.5
./configure --enable-shared --prefix=/usr/local
make
sudo make install
cd ..

curl -O ftp://ftp.remotesensing.org/libtiff/tiff-3.8.2.tar.gz
tar xzvf tiff-3.8.2.tar.gz
cd tiff-3.8.2
./configure --prefix=/usr/local
make
sudo make install
cd ..

curl -O http://superb-east.dl.sourceforge.net/sourceforge/wvware/libwmf-0.2.8.4.tar.gz
tar xzvf libwmf-0.2.8.4.tar.gz
cd libwmf-0.2.8.4
make clean
./configure
make
sudo make install
cd ..

curl -O http://www.littlecms.com/lcms-1.17.tar.gz
tar xzvf lcms-1.17.tar.gz
cd lcms-1.17
make clean
./configure
make
sudo make install
cd ..

curl -O http://superb-east.dl.sourceforge.net/sourceforge/ghostscript/ghostscript-8.61.tar.gz
tar zxvf ghostscript-8.61.tar.gz
cd ghostscript-8.61/
./configure  --prefix=/usr/local
make
sudo make install
cd ..

curl -O http://mirror.cs.wisc.edu/pub/mirrors/ghost/GPL/current/ghostscript-fonts-std-8.11.tar.gz
tar zxvf ghostscript-fonts-std-8.11.tar.gz
sudo mv fonts /usr/local/share/ghostscript

curl -O http://image_magick.veidrodis.com/image_magick/ImageMagick-6.4.8-7.tar.gz
tar xzvf ImageMagick-6.4.8-7.tar.gz
cd ImageMagick-6.4.8-7
export CPPFLAGS=-I/usr/local/include
export LDFLAGS=-L/usr/local/lib
./configure --prefix=/usr/local --disable-static --with-modules --without-perl --without-magick-plus-plus --with-quantum-depth=8 --with-gs-font-dir=/usr/local/share/ghostscript/fonts
make
sudo make install
cd ..

