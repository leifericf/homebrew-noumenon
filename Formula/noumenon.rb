class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.0.0" # Updated automatically by release workflow

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v#{version}/noum-macos-arm64"
      sha256 "PLACEHOLDER" # Updated automatically by release workflow
    else
      url "https://github.com/leifericf/noumenon/releases/download/v#{version}/noum-macos-x86_64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v#{version}/noum-linux-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v#{version}/noum-linux-x86_64"
      sha256 "PLACEHOLDER"
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
