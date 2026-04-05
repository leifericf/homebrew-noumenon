class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.2"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.2/noum-macos-arm64"
    sha256 "cc093abea91a036a410c61772d9e03ae073d6c58236dc3b7072a164eac163609"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.2/noum-linux-arm64"
      sha256 "1b0461a0edffe48f72dbb6bbc7a6fdf4947355ee4a4a6ec9d2b6988ddb760c80"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.2/noum-linux-x86_64"
      sha256 "665357e6a427e501d917f9cf9491775da17d852fb38e940a1d301a8d1f12760c"
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
