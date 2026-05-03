class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.10.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.10.1/noum-macos-arm64"
    sha256 "fe10938dd5aff36ccbb4f4c4a462eec3ceba50d38b12ffe999def496c04c7b3f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.1/noum-linux-arm64"
      sha256 "e3d8d92f93eead200dece12315261195d101cdf7a51ae5208c1aed843cdd2c30"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.1/noum-linux-x86_64"
      sha256 "ba5ad2cad0c0eb860540f840d021c06a75104952fd8e036a8935109c19c44132"
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
