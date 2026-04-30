class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.6.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.6.1/noum-macos-arm64"
    sha256 "d2b0b9c9191db703b84397d1e200266f33bbd4d5a719fda5c0d00e5bba26e6b8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.6.1/noum-linux-arm64"
      sha256 "2b41e62894d8fbb6513b5ae3ed21108f2d318b06a4f155bbde8f1a12b52b3d7c"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.6.1/noum-linux-x86_64"
      sha256 "10249a7c15d9e516a1721e125ae49a9f8c5baae77b3cf88b19680a271478a203"
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
