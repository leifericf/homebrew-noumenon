class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.3.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-macos-arm64"
    sha256 "1e59463708dcef4be9cb4398d343c6145d7b63e522175fd448fef4ad93d3271f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-arm64"
      sha256 "a656d51c1b8908fddc19d8246704ac9ad3fbb4a52f698e9300978309b16535d4"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-x86_64"
      sha256 "588317ea7116ea05625aeb69218efce0d4085e4010d44e955b85b4e43847950e"
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
