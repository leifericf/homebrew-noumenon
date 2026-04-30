class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.6.2"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.6.2/noum-macos-arm64"
    sha256 "8a1aa0a9fa5e1646a364e63da486ead013c59214d91f4b1bac8da004b5cac778"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.6.2/noum-linux-arm64"
      sha256 "6b491cde969ad2db8f6f6087b410e0f59a3a20ca6dd1000ef0861ec942973d33"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.6.2/noum-linux-x86_64"
      sha256 "1345fed07cd4b10e6a2f74100069e6216e0cdc78836fdc0ad132069063ae768e"
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
