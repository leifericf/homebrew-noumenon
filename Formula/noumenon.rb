class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.12.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.12.1/noum-macos-arm64"
    sha256 "f2df0bfac78d34965ed32d5032f9b1ae7f0193fcc86e6c8c8352d40a7f8172a8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.1/noum-linux-arm64"
      sha256 "ff9cdea462e35deab3feebb51c9c98d3ceb3c6be3c0374f3d9e6675bbafe42cd"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.1/noum-linux-x86_64"
      sha256 "2d2664ad23f90086bd3c43d99c1207e087f9cacc10991ad21763c3e28badbe2a"
    end
  end

  def install
    binary = Dir["noum-*"].first
    bin.install binary => "noum"
  end

  test do
    assert_match "noum", shell_output("#{bin}/noum version")
  end
end
