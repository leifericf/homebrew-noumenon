class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.3"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.3/noum-macos-arm64"
    sha256 "6771082fdcb8ffada653798d78f63785f4ad0a44181d199434b6d8e0a942f7a5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.3/noum-linux-arm64"
      sha256 "0347e89b8247c60e69a0515f4cda22a0fec167997cca20d790304816299b57fa"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.3/noum-linux-x86_64"
      sha256 "1dc06236eb8da52ea77a12e7c8e22d6872b695dfb0b27167d0609652f170bb50"
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
