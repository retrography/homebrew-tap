class ElinksAT013 < Formula
  desc "Text mode web browser"
  homepage "http://elinks.or.cz/"
  url "http://elinks.or.cz/download/elinks-current-0.13.tar.bz2"
  sha256 "bce5e0219e491608e634348a1985200b82900e992711a76410bf594eb342f9b9"
  revision 3

  head do
    url "http://elinks.cz/elinks.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

<<<<<<< Updated upstream
  depends_on "openssl"
=======
  depends_on "gnutls"
>>>>>>> Stashed changes
  depends_on "tre"
  depends_on :x11

  def install
    ENV.deparallelize
    ENV.delete("LD")
    system "./autogen.sh" if build.head?
    system "./configure", "--prefix=#{prefix}", "--without-lua",
                          "--enable-256-colors", "--enable-true-color",
<<<<<<< Updated upstream
=======
                          "--enable-uri-rewrite", "--with-guntls",
>>>>>>> Stashed changes
                          "--enable-fastmem"
    system "make", "install"
  end

  test do
    (testpath/"test.html").write <<~EOS
      <!DOCTYPE html>
      <title>elinks test</title>
      Hello world!
      <ol><li>one</li><li>two</li></ol>
    EOS
    assert_match /^\s*Hello world!\n+ *1. one\n *2. two\s*$/,
                 shell_output("#{bin}/elinks test.html")
  end
end
