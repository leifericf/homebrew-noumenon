class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.3.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-macos-arm64"
    sha256 "eef7ed3c40deb85457f823069beb394e624016f8461ffd514fc76cbe3ed09b65"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-arm64"
      sha256 "162dd4bd946a9aac3180772fd2c9cb96b4d008e7d7d2c7299651e7aeda30c073"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-x86_64"
      sha256 "e678a3454c1684879eee22abdc73ce048ca782ebf673239ec22d82f66c9f92f5"
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
