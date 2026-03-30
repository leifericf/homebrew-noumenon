class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.3.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-macos-arm64"
    sha256 "ed93faa9b138f5f038f4ecad9072de028fed090c19ea81d65e8f78655c7bcdc1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-arm64"
      sha256 "3461f3cbc2cb9ad6c7c70588abf485fcb7545baaec1e89811e56cb389c9539cf"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-x86_64"
      sha256 "f0c3cf3fc4b7f0a0e12e2ed821038727aaf9fc1472ecc0cff5221fc51fdca100"
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
