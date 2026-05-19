class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.12.3"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.12.3/noum-macos-arm64"
    sha256 "dfac4a681f501335c854b7d2765999b4350125ad606d923a3d45e0361b195cda"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.3/noum-linux-arm64"
      sha256 "1761f2e684c4ffec3dbf0b6260b067d35dc089f13a4354df41f6f2277baa9374"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.3/noum-linux-x86_64"
      sha256 "16969e7a066261b37966ae24bcdc1d115a90df4f6949bd28c6fb0cf314ca7ff3"
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
