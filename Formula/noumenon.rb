class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.8.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.8.0/noum-macos-arm64"
    sha256 "667f20a5d2c8b27d6589ca9c1c0ac71d4bb27d9f3d8530f1227e6882588665b9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.8.0/noum-linux-arm64"
      sha256 "4a585147d346af1034c98fd730e213a2cfe984d11f16af8e7256e60b61ea2dc8"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.8.0/noum-linux-x86_64"
      sha256 "df181086dc50d1018ffd2d4b437e5e750621dbb8aceb810f2e784b48cb20e310"
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
