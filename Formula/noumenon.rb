class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.12.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.12.0/noum-macos-arm64"
    sha256 "90755722a1ed8db50132c9d6298434fa03d034509606d24ee86739641cd67fa8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.0/noum-linux-arm64"
      sha256 "c84301138fc8ba067d8a27332c0d00198c034f482ddd42617188173103fdc0ed"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.0/noum-linux-x86_64"
      sha256 "b12b1d1463f1bfd722b971f072dfce0c0e0ed0878b02882924f9bac9eb79efbd"
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
