class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.3.1"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-macos-arm64"
    sha256 "8e5c9b3b1f3e0e1130616a697aefd3ee9a7359bab7e3468161b3e39828c9e1b0"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-arm64"
      sha256 "45239cf266b5601744c6d281cc6e32c75b607d7d30833463e02e7e5947d555b2"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.3.1/noum-linux-x86_64"
      sha256 "2a9c125b5f43e5aacf9ad2c47b03c01f706b77dde126bd24d2d0c3f94f927d2c"
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
