# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Asprint < Formula
  desc "Command-line program for OS X that pretty-prints out contents of compiled AppleScript (.scpt) files using ANSI escape sequences."
  homepage "http://hasseg.org/asprint"
  head "https://github.com/ali-rantakari/asprint.git"

  patch :DATA

  def install
    system "make"
    bin.install("asprint")
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test asprint`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end

__END__
diff --git a/Makefile b/Makefile
index d4a5642..418e740 100644
--- a/Makefile
+++ b/Makefile
@@ -14,7 +14,7 @@ VERSIONCHANGELOGFILELOC="$(TEMP_DEPLOYMENT_DIR)/changelog.html"
 GENERALCHANGELOGFILELOC="changelog.html"
 SCP_TARGET=$(shell cat ./deploymentScpTarget)
 DEPLOYMENT_INCLUDES_DIR="./deployment-files"
-COMPILER="/Developer/usr/bin/clang"
+COMPILER="clang"
 #COMPILER="gcc"
 
 
@@ -39,7 +39,7 @@ asprint: asprint.m ANSIEscapeHelper.m
 	@echo
 	@echo ---- Compiling:
 	@echo ======================================
-	$(COMPILER) -O2 -Wall -force_cpusubtype_ALL -mmacosx-version-min=10.5 -arch i386 -arch ppc -framework Cocoa -o $@ asprint.m ANSIEscapeHelper.m
+	$(COMPILER) -O2 -Wall -force_cpusubtype_ALL -mmacosx-version-min=10.5 -arch i386 -framework Cocoa -o $@ asprint.m ANSIEscapeHelper.m
 
 
 

