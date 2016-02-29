# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MongoCxxLegacy < Formula
  desc ""
  homepage ""
  url "https://github.com/mongodb/mongo-cxx-driver/archive/legacy-1.1.0.tar.gz"
  version "1.1.0"
  sha256 "9bbc59ae16f0c93b0260a4b7bb3e417cd284bdb5600fcf833135cbbc361c9472"

  depends_on "scons" => :build
#  depends_on "libbson"
 # depends_on "mongo-c"
  #depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
  # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    #system "./configure", "--disable-debug",
#                          "--disable-dependency-tracking",
#                          "--disable-silent-rules",
#                          "--prefix=#{prefix}"
#    args = std_cmake_args.concat #%W[
#      -LIBBSON_DIR=#{Formula["libbson"].opt_prefix}/lib
#    ]
#ENV.append "CXXFLAGS", "-L'#{Formula["libbson"].opt_prefix}/lib'"
    #Dir.mkdir "build"
    #Dir.chdir "build" do
      system "scons", "--prefix=#{prefix}", "install"

#      lib.install_symlink Dir["lib/*"]
#    end
    #system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test mongo-cxx-driver`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
