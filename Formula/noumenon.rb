class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.10.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.10.0/noum-macos-arm64"
    sha256 "fc442a0b5a3a7eb8e28ad781ac88de82ac64c58e91ca08b06ff2d17e0313a01e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.0/noum-linux-arm64"
      sha256 "ac3536d6ea646b1b1ee9483900ccb3e6e619fec5765910276e1a806d1bb2ff73"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.0/noum-linux-x86_64"
      sha256 "73b6c6d53a8d8886129063ee6bb50020ad16054b2b71bce4870ee82e2ab70de1"
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
