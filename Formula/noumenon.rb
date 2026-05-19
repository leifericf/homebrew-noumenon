class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.12.2"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.12.2/noum-macos-arm64"
    sha256 "308150325cf994d452796cb7fdb036c0639f65679d676af78f1fc3fdd853ffaa"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.2/noum-linux-arm64"
      sha256 "09890f8c0d352f2fa66ee3edfb01029b7214228de4650d53b032256411a817b5"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.12.2/noum-linux-x86_64"
      sha256 "1ef5a64c47fb1862d7f5a84847f6479f0e94339726779dd5fb4f051b620c4bcd"
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
