# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MongoCxxDriver < Formula
  desc ""
  homepage ""
  url "https://github.com/mongodb/mongo-cxx-driver/archive/r3.0.0.tar.gz"
  version "3.0.0"
  sha256 "ef0440aa43b5b108c21714c0ba919f28c114a0fcade2bf4197c4c8919c6bf36e"

  depends_on "cmake" => :build
  depends_on "libbson"
  depends_on "mongo-c"
  #depends_on :x11 # if your formula requires any X11/XQuartz components

  patch :DATA
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
    Dir.chdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
      #lib.install_symlink Dir["lib/*"]
    end
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

__END__
diff --git a/src/bsoncxx/exception/error_code.cpp b/src/bsoncxx/exception/error_code.cpp
index 1fdf985..88bb888 100644
--- a/src/bsoncxx/exception/error_code.cpp
+++ b/src/bsoncxx/exception/error_code.cpp
@@ -13,6 +13,7 @@
 // limitations under the License.
 
 #include <bsoncxx/exception/error_code.hpp>
+#include <string>
 
 #include <bsoncxx/config/private/prelude.hpp>
 
diff --git a/src/mongocxx/exception/error_code.cpp b/src/mongocxx/exception/error_code.cpp
index bb7dc4d..a5cd157 100644
--- a/src/mongocxx/exception/error_code.cpp
+++ b/src/mongocxx/exception/error_code.cpp
@@ -13,6 +13,7 @@
 // limitations under the License.
 
 #include <mongocxx/exception/error_code.hpp>
+#include <string>
 
 #include <mongocxx/config/private/prelude.hpp>
 
diff --git a/src/mongocxx/exception/server_error_code.cpp b/src/mongocxx/exception/server_error_code.cpp
index c2e1be8..9d880e7 100644
--- a/src/mongocxx/exception/server_error_code.cpp
+++ b/src/mongocxx/exception/server_error_code.cpp
@@ -13,6 +13,7 @@
 // limitations under the License.
 
 #include <mongocxx/exception/server_error_code.hpp>
+#include <string>
 
 #include <mongocxx/config/private/prelude.hpp>
 
