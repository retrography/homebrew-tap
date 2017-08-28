require 'formula'

class Scantailor < Formula
  homepage 'http://github.com/scantailor/scantailor'
  head 'https://github.com/scantailor/scantailor.git'
  url 'https://github.com/scantailor/scantailor/archive/RELEASE_0_9_12_1.tar.gz'
  sha256 'ef5d5bdca207ab00701121a32e9b95c7c7353c642b9538b3f9ca040d8d1a5dde'
  version = '0.9.12.1'


  depends_on 'cmake' => :build
  depends_on 'cartr/qt4/qt@4' # tap cart/qt4 and install qt@4 formula (qt version 4) before installing
  depends_on 'boost'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on 'libpng'
  depends_on 'zlib'

  def install
    system "cmake . #{std_cmake_parameters} -DPNG_INCLUDE_DIR=/usr/X11/include"
    system "make install"

    # Create app bundle
    pack = "packaging/osx"
    app = "app/ScanTailor.app"
    appcon = "#{app}/Contents"
    macos = "#{appcon}/MacOS"
    resources = "#{appcon}/Resources"
    frameworks = "#{appcon}/Frameworks"
    
    repstring = <<-HEREDOC
<string>10.12.0</string>
	<key>NSHighResolutionCapable</key>
	<string>True</string>
    HEREDOC
    
    inreplace "#{pack}/Info.plist.in", "@VERSION@", version
    inreplace "#{pack}/Info.plist.in", "<string>10.4.0</string>\n", repstring
    mv "#{pack}/Info.plist.in", "#{pack}/Info.plist"
    (buildpath/macos).mkpath
    (buildpath/resources).mkpath
    (buildpath/frameworks).mkpath
    (buildpath/appcon).install "#{pack}/Info.plist"
    (buildpath/macos).install "#{bin}/scantailor"
    (buildpath/resources).install "#{pack}/ScanTailor.icns"
    (buildpath/resources).install Dir["#{share}/scantailor/translations/scantailor_*.qm"]
    prefix.install "#{buildpath}/#{app}"
    bin.install_symlink prefix/"ScanTailor.app/Contents/MacOS/scantailor"
    (share/"scantailor/translations").install_symlink Dir["#{prefix}/ScanTailor.app/Contents/Resources/scantailor_*.qm"]
  end
end
