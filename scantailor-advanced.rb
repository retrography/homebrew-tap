require 'formula'

class ScantailorAdvanced < Formula
  homepage 'https://github.com/4lex4/scantailor-advanced'
  head 'https://github.com/4lex4/scantailor-advanced.git'
  url 'https://github.com/4lex4/scantailor-advanced/archive/v1.0.16.tar.gz'
  sha256 '84629d2edba4c36c62bdb75eedb145262b894d950bcb95cec0dab43e21bdb909'
  version = '1.0.16'


  depends_on 'cmake' => :build
  depends_on 'qt'
  depends_on 'boost'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on 'libpng'
  depends_on 'zlib'

  def install
    system "cmake", ".", *std_cmake_args, "-DPNG_INCLUDE_DIR=/usr/X11/include", "-DCMAKE_PREFIX_PATH=$(brew --prefix qt5)"
    system "make", "install"
    
    # Create app bundle
    # pack = "packaging/osx"
    # app = "app/ScanTailor.app"
    # appcon = "#{app}/Contents"
    # macos = "#{appcon}/MacOS"
    # resources = "#{appcon}/Resources"
    # frameworks = "#{appcon}/Frameworks"
    #
    # mv "#{pack}/Info.plist.in", "#{pack}/Info.plist"
    # (buildpath/macos).mkpath
    # (buildpath/resources).mkpath
    # (buildpath/frameworks).mkpath
    # (buildpath/appcon).install "#{pack}/Info.plist"
    # (buildpath/macos).install "#{bin}/scantailor"
    # (buildpath/resources).install "#{pack}/ScanTailor.icns"
    # (buildpath/resources).install Dir["#{share}/scantailor/translations/scantailor_*.qm"]
    # prefix.install "#{buildpath}/#{app}"
    # bin.install_symlink prefix/"ScanTailor.app/Contents/MacOS/scantailor"
    # (share/"scantailor/translations").install_symlink Dir["#{prefix}/ScanTailor.app/Contents/Resources/scantailor_*.qm"]
  end
end
