class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.6.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.6.0/noum-macos-arm64"
    sha256 "9365ef5ef62a1eb32ba7491422fa77e26372b80ad757ca2c779db79e7ecc73dd"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.6.0/noum-linux-arm64"
      sha256 "0b840d01fe8f2a443ff8a90ed797eb29d304c99732492b6af15deab95f629cc2"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.6.0/noum-linux-x86_64"
      sha256 "95f24301c594c1ccaf9b2e04146dad1927d14de5c8ef8095b550434afc4d4f01"
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
