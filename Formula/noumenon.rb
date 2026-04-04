class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.5.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.5.0/noum-macos-arm64"
    sha256 "6328ea704953fc588b890fe4163190f9b92c64680b68ca56d6fe6f76211fcd01"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.0/noum-linux-arm64"
      sha256 "e919cb13b0b5b0e5626add559bba70c0501d55fd6c624099471195ee7ab0853c"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.5.0/noum-linux-x86_64"
      sha256 "dd03d8d8b32a14b72a78d8ecb4c1c0428fe85b45e57792030ddb2ad41c2a511f"
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
