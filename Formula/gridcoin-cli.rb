class GridcoinCli < Formula
  desc "Gridcoin Research CLI for macOS"
  homepage "https://gridcoin.us/"

  stable do
    url "https://github.com/gridcoin-community/Gridcoin-Research/archive/5.3.2.0.tar.gz"
    sha256 "8cc7d668e3a189877ffcf535076bef928a553da0b393729f1f6576524ad2d813"
    patch <<-EOS
      diff --git a/configure.ac b/configure.ac
      index eb96af9c..8b692612 100644
      --- a/configure.ac
      +++ b/configure.ac
      @@ -829,5 +823,5 @@
       if test x$use_boost = xyes; then
       
      -BOOST_LIBS="$BOOST_LDFLAGS $BOOST_SYSTEM_LIB $BOOST_FILESYSTEM_LIB $BOOST_ZLIB_LIB $BOOST_IOSTREAMS_LIB $BOOST_PROGRAM_OPTIONS_LIB $BOOST_THREAD_LIB $BOOST_CHRONO_LIB $BOOST_ZLIB_LIB"
      +BOOST_LIBS="$BOOST_LDFLAGS $BOOST_SYSTEM_LIB $BOOST_FILESYSTEM_LIB $BOOST_ZLIB_LIB $BOOST_IOSTREAMS_LIB $BOOST_PROGRAM_OPTIONS_LIB $BOOST_THREAD_LIB $BOOST_CHRONO_LIB $BOOST_ZLIB_LIB -lboost_system-mt"
       
       
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


  depends_on "boost"
  depends_on "berkeley-db"
  depends_on "leveldb"
  depends_on "openssl"
  depends_on "miniupnpc"
  depends_on "libzip"
  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build


  def install
    args = %W[
      BOOST_INCLUDE_PATH=#{Formula["boost"].include}
      BOOST_LIB_PATH=#{Formula["boost"].lib}
      OPENSSL_INCLUDE_PATH=#{Formula["openssl"].include}
      OPENSSL_LIB_PATH=#{Formula["openssl"].lib}
      BDB_INCLUDE_PATH=#{Formula["berkeley-db"].include}
      BDB_LIB_PATH=#{Formula["berkeley-db"].lib}
      MINIUPNPC_INCLUDE_PATH=#{Formula["miniupnpc"].include}
      MINIUPNPC_LIB_PATH=#{Formula["miniupnpc"].lib}
    ]

    system "./autogen.sh"
    system "unset OBJCXX ; ./configure --with-incompatible-bdb --without-gui --disable-tests --disable-bench --disable-dependency-tracking --disable-asm"
    system "make"
    system "strip", "src/gridcoinresearchd"
    bin.install "src/gridcoinresearchd"
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
