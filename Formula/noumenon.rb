class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.11.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.11.0/noum-macos-arm64"
    sha256 "69e922f67ec3b0d52d9be143de41e59608aedec0595b97c94bfddc9cd282842a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.11.0/noum-linux-arm64"
      sha256 "b820aa5e64a34011008ab34044683ae7cee17317ef272a75bc7b72a8b3e749c5"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.11.0/noum-linux-x86_64"
      sha256 "596b8da8b4b47754fcbf8bb0f32ad6ad7180ca7a5b315d2f452eed908a3f7b11"
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
