class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.4"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.4/noum-macos-arm64"
    sha256 "efc57e0e58348b61928e37640e21df29c36513ff77b67064dc2a9710d3464a01"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.4/noum-linux-arm64"
      sha256 "0c8200db49a00746c918b6aeec3d5ba2d226950382600b381abfb9ea5007fbbb"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.4/noum-linux-x86_64"
      sha256 "790f09cde4928bb2b29e162a1c79ec4bb52ec2db0eeb091064bf9f57d192d895"
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
