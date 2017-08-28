require 'formula'

class Scantailor < Formula
  homepage 'http://github.com/scantailor/scantailor'
  head 'https://github.com/couchbase/geocouch.git'
  url 'https://github.com/scantailor/scantailor/archive/RELEASE_0_9_12_1.tar.gz'
  sha256 'ef5d5bdca207ab00701121a32e9b95c7c7353c642b9538b3f9ca040d8d1a5dde'


  depends_on 'cmake' => :build
  depends_on 'cartr/qt4/qt@4'
  depends_on 'boost'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on 'libpng'
  depends_on 'zlib'

  def install
    system "cmake . #{std_cmake_parameters} -DPNG_INCLUDE_DIR=/usr/X11/include"
    system "make install"
  end
end
