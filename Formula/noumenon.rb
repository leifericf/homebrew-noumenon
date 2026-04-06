class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.5"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.5/noum-macos-arm64"
    sha256 "e162215b0e566c37e41aadf558089c683b2d726011d754d24156f4267730a092"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.5/noum-linux-arm64"
      sha256 "1c68427dac2102cc01af84d247b399f64decca9895505d9458bc764f85844657"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.5/noum-linux-x86_64"
      sha256 "7e0962d1ad8564ca8e00b41148a946ccbaaa4c1219723a22881ff781a770950e"
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
