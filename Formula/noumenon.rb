class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.11.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.11.1/noum-macos-arm64"
    sha256 "9e4b366cfbf919076c39ddeb82a7ba9aa5ac4bf07bd8c4400265733b6cf6e885"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.11.1/noum-linux-arm64"
      sha256 "960232c4b97a220fd7d63bb826a4566a5ad1743566d02657def81b0818b8af27"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.11.1/noum-linux-x86_64"
      sha256 "2a7489c08526c9ee7b9684dffb2a28c2927458e61afaf2112ccdc66a43058826"
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
