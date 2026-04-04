class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.1/noum-macos-arm64"
    sha256 "2e69c2de5b21d34dabf33793d2f8ac3fbf202e0b4d52e8d36ed3e5da589bd5f2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.1/noum-linux-arm64"
      sha256 "5a2cc08277da86f97e4611337b8a80c26ce0f8a7129059d2f452737944bf3945"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.1/noum-linux-x86_64"
      sha256 "fcdc92669e1b4d5c7d9bcb46371bc86f280194cd5ef1804e2343680fd36768d0"
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
