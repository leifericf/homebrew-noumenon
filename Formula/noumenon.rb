class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.10.3"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.10.3/noum-macos-arm64"
    sha256 "3ba0b25bf603a7b72fa188d8b93d4487df679a62b960fb0c83dc440e65c8382a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.3/noum-linux-arm64"
      sha256 "c17bdff7e5e94e19d5e4e68fe91e34672ed032a9acff21be520d647f572a43eb"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.3/noum-linux-x86_64"
      sha256 "04e58fbe786fc988e24f95676bbbce860253586d17be05cb5ab0319b1bac5ec5"
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
