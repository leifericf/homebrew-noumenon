class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.6"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.6/noum-macos-arm64"
    sha256 "631d86187ae3c49769762f94176e2a1aa1975c9f09ccaea2753bb32cabd29d9a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.6/noum-linux-arm64"
      sha256 "3a19de4383d408300fc7cbc169601fc402e919f13df6ab6e8139dc2c30a8ea14"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.6/noum-linux-x86_64"
      sha256 "f788beab8a2d31fa6a2163b4a83aa7a31b0a128561134df2ae6685c3a6858eef"
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
