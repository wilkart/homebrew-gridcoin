class GridcoinCliDb4 < Formula
  desc "Gridcoin Research CLI for macOS"
  homepage "https://gridcoin.us/"

  stable do
    url "https://github.com/gridcoin-community/Gridcoin-Research/archive/5.3.3.0.tar.gz"
    sha256 "45c80a24a289c5488df8cf3fdc713b19679a9a248de75227b552d72321ac0ed7"
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


  depends_on "boost"
  depends_on "berkeley-db@4"
  depends_on "leveldb"
  depends_on "openssl@1.1"
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
      OPENSSL_INCLUDE_PATH=#{Formula["openssl@1.1"].include}
      OPENSSL_LIB_PATH=#{Formula["openssl@1.1"].lib}
      BDB_INCLUDE_PATH=#{Formula["berkeley-db"].include}
      BDB_LIB_PATH=#{Formula["berkeley-db"].lib}
      MINIUPNPC_INCLUDE_PATH=#{Formula["miniupnpc"].include}
      MINIUPNPC_LIB_PATH=#{Formula["miniupnpc"].lib}
      --with-boost=#{boost}
      --with-incompatible-bdb
      --without-gui
      --disable-tests
      --disable-bench
      --disable-dependency-tracking
      --disable-asm
    ]

    system "cd src ; ../contrib/nomacro.pl"
    system "./autogen.sh"
    ENV.delete "OBJCXX"
    system "./configure", *configure_args
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
