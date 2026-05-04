class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.10.2"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.10.2/noum-macos-arm64"
    sha256 "84dfcfad2f361e2d0190f4353e201838b1c2e1bf0b1b88e5b110525236239994"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.2/noum-linux-arm64"
      sha256 "c591dfc9ed7ad9f5a19df37f5f8a385b4f8f3309c31ec0afb4a5cdd3fc038716"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.10.2/noum-linux-x86_64"
      sha256 "07ddb317a4149aa60cafb4a41cadc62a43effabf45538adbce41544f11aefb63"
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
