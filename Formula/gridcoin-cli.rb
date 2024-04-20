class GridcoinCli < Formula
  desc "Gridcoin Research CLI for macOS"
  homepage "https://gridcoin.us/"

  stable do
    url "https://github.com/gridcoin-community/Gridcoin-Research/archive/refs/tags/5.4.8.0.tar.gz"
    sha256 "6d1f263bc210775632e156fd79b518e0fae90bae829d299f87e95bc84f9688d1"
    patch <<-EOS
      diff --git a/configure.ac b/configure.ac
      index eb96af9c..8b692612 100644
      --- a/configure.ac
      +++ b/configure.ac
      @@ -829,5 +823,5 @@
       if test x$use_boost = xyes; then
       
      -BOOST_LIBS="$BOOST_LDFLAGS $BOOST_SYSTEM_LIB $BOOST_FILESYSTEM_LIB $BOOST_IOSTREAMS_LIB $BOOST_THREAD_LIB $BOOST_ZLIB_LIB"
      +BOOST_LIBS="$BOOST_LDFLAGS $BOOST_SYSTEM_LIB $BOOST_FILESYSTEM_LIB $BOOST_IOSTREAMS_LIB $BOOST_THREAD_LIB $BOOST_ZLIB_LIB -lboost_system-mt"
       
      @@ -1171,5 +1165,7 @@ echo "  CFLAGS        = $CFLAGS"
       echo "  CPPFLAGS      = $CPPFLAGS"
       echo "  CXX           = $CXX"
       echo "  CXXFLAGS      = $CXXFLAGS"
      +echo "  OBJCXX        = $OBJCXX"
      +echo "  OBJCXXFLAGS   = $OBJCXXFLAGS"
       echo "  LDFLAGS       = $LDFLAGS"
       echo
    EOS
  end

#  bottle do
#    root_url "https://at.gridcoin.pl"
#    sha256 cellar: :any, arm64_sonoma: "427dd3c66fdda24d30b070f23c3d416ff9f091e374c3b7c98ded40f2a34faa4b"
#  end

  depends_on "boost"
  depends_on "leveldb"
  depends_on "openssl@3"
  depends_on "miniupnpc"
  depends_on "libzip"
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build


  def install
    boost = Formula["boost"].opt_prefix

    configure_args = %W[
      BOOST_ROOT=#{boost}
      BOOST_INCLUDE_PATH=#{boost}/include
      BOOST_LIB_PATH=#{boost}/lib
      OPENSSL_INCLUDE_PATH=#{Formula["openssl@3"].include}
      OPENSSL_LIB_PATH=#{Formula["openssl@3"].lib}
      MINIUPNPC_INCLUDE_PATH=#{Formula["miniupnpc"].include}
      MINIUPNPC_LIB_PATH=#{Formula["miniupnpc"].lib}
      --with-boost=#{boost}
      --without-gui
      --disable-tests
      --disable-bench
      --disable-dependency-tracking
      --disable-asm
      --enable-reduce-exports
    ]

    system "cd src ; ../contrib/nomacro.pl"
    system "./autogen.sh"
    ENV.delete "OBJCXX"
    system "./configure", *configure_args
    system "make"
    system "strip", "src/gridcoinresearchd"
    bin.install "src/gridcoinresearchd"
    man1.install ["doc/gridcoinresearchd.1"]
  end

  def caveats
    <<~EOS
      Gridcoin is a peer-to-peer cryptocurrency that uses distributed computing (BOINC).
      See also: 
      - man 1 gridcoinresearchd
      - gridcoinresearchd --help
      - gridcoinresearchd help
    EOS
  end

  service do
    run [opt_bin/"gridcoinresearchd", "--daemon=0", "--synctime=1", "--disableupdatecheck=1"]
    keep_alive true
    require_root false
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test Gridcoin`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
