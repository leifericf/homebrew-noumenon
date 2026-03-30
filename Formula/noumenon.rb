class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.3.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-macos-arm64"
    sha256 "d4082647ec9552cb30ea27f6d8431e948176dcd0703d558e2b0384899ded6880"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-arm64"
      sha256 "424a4532e5764a66ac28d0df217c0947d0de6563d91b443b88d1ed64ee4c2069"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-x86_64"
      sha256 "2015ea35f6eeccc8138efbadd8acb770d8177716215cf2e04135886fc13097df"
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
