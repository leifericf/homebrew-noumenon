class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.0/noum-macos-arm64"
    sha256 "6be02f3aaaeeb85fe4104e554958f616e76a01fa079380b801b0278fe58ad550"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.0/noum-linux-arm64"
      sha256 "1f45c75e1ae18f0104195623372b9c92fbf25191494f72b293595103102eba06"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.0/noum-linux-x86_64"
      sha256 "0aea81c5895854d7eea0f7330b6873368498e246ef70632073724ffef73b26c0"
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
