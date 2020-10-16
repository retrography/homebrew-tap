class Audioswitch < Formula
  desc "Change OS X audio source from the command-line"
  homepage "https://github.com/retrography/audioswitch"
  url "https://github.com/retrography/audioswitch/archive/1.5.1.tar.gz"
  sha256 "314c12bbb264c3b86d3efb4f66e77486ea8b64b8f44f94913b6799dd36b5becb"
  head "https://github.com/retrography/audioswitch.git"

  depends_on :macos => :sierra
  depends_on "cmake" => :build

  def install
    args =  std_cmake_args.concat %W[-DCMAKE_INSTALL_PREFIX=#{prefix}]
    Dir.mkdir "build"
    Dir.chdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/audioswitch", "-c"
  end
end
