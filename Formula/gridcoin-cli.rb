class GridcoinCli < Formula
  desc "Gridcoin Research CLI for macOS"
  homepage "https://gridcoin.us/"

  stable do
    url "https://github.com/gridcoin-community/Gridcoin-Research/archive/refs/tags/5.5.0.0.tar.gz"
    sha256 "407e06412903737f9afdeda5bad2503471bcf24e7672a97a35b8069cbffa27e8"
    patch <<-EOS
      diff --git a/src/clientversion.cpp b/src/clientversion.cpp
      index c0729302d..8735ebfe1 100644
      --- a/src/clientversion.cpp
      +++ b/src/clientversion.cpp
      @@ -13,7 +13,7 @@
        * for both gridcoinresearchd and gridcoinresearch-qt, to make it harder for attackers to
        * target servers or GUI users specifically.
        */
      -const std::string CLIENT_NAME("Halford");
      +const std::string CLIENT_NAME("Natasha");
    EOS
  end

  bottle do
    root_url "https://bootles.gridcoin.pl"
    sha256 cellar: :any, arm64_tahoe: "fd0e09a7a8b797ea8c6c2a6251ed1817d0c8d5471afce0cdcde40a1f7839469b"
  end

  depends_on "boost"
  depends_on "openssl@3"
  depends_on "miniupnpc"
  depends_on "libzip"
  depends_on "icu4c@78"
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "cmake" => :build

  def install
    cmake_args = %w[
      -DCMAKE_PREFIX_PATH=#{Formula["icu4c@78"].opt_prefix}
      -DENABLE_GUI=off
      -DENABLE_TESTS=off
      -DCMAKE_BUILD_TYPE=Release
      -DENABLE_PIE=on
      -DENABLE_UPNP=on
      -DDEFAULT_UPNP=on
      -DOPENSSL_ROOT_DIR=#{Formula["openssl@3"].opt_prefix}
    ]

    system "grep", "CLIENT_NAME", "src/clientversion.cpp"
    system "cmake", "-B", "build", *std_cmake_args, *cmake_args
    system "cmake", "--build", "build", "--clean-first", "--parallel", ENV.make_jobs
    system "strip", "build/bin/gridcoinresearchd"
    bin.install "build/bin/gridcoinresearchd"
    man1.install ["doc/gridcoinresearchd.1"]
  end

  def caveats
    <<~EOS
      Gridcoin is a peer-to-peer cryptocurrency that rewards users for contributing to BOINC distributed computing projects.
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
    system "false"
  end
end
