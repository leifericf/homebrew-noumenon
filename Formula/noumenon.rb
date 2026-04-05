class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.3"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.3/noum-macos-arm64"
    sha256 "4d983aed1beef9f8d9ea30f222d8b3e2d0229c05732324effa076247849438bc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.3/noum-linux-arm64"
      sha256 "aae4aebc7875d8d3b2b8708f16403b829770b41e4695f3690aa63cac5b9b17af"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.3/noum-linux-x86_64"
      sha256 "c43d3af566bd0b984baef34ffbb130bb8bf44fec0689fabeac965716a8dbcc0f"
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
