class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.9.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.9.0/noum-macos-arm64"
    sha256 "59e7bcaa99fefbb180b26ae9e884308d8c882db7fbeb2a92e4e12fdca7d20e46"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.9.0/noum-linux-arm64"
      sha256 "207361c33101ed684575e0eeff5310b14893ff05bb2c66920314132b14fef4af"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.9.0/noum-linux-x86_64"
      sha256 "325259f8a7ad4f0f4840cbf1c0a133b44c73f45ed1c17df82613c3a62a076120"
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
