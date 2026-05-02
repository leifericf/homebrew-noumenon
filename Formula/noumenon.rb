class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.7.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.7.0/noum-macos-arm64"
    sha256 "fd492aa7bd0c8cd42cc36706c3ff3202a025756325b4a1138fb22c02ae98aca7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.7.0/noum-linux-arm64"
      sha256 "7edc248367dc5dfb212ec66aa778b4345794b4f8c82e9e827b88b48f54363c5b"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.7.0/noum-linux-x86_64"
      sha256 "c515478d1540de59cf708158ffeac5d2349a7e095a991e5c937385e358f1730a"
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
