class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.5"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.5/noum-macos-arm64"
    sha256 "ab77af196be1fa326bbd8f7acfa188cec10a51c9c19552d1d0192fbe476b9c1e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.5/noum-linux-arm64"
      sha256 "d2db160f8f77489cea6b35406358fa047a2b00c8d82ca1cd04dcec01e817b799"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.5/noum-linux-x86_64"
      sha256 "8faebb03c89f1ff9973288eacfa1f3bf920d784e5c6962656d7e60e94c24bad7"
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
