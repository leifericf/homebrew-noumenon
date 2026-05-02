class Noumenon < Formula
  desc "Datomic knowledge graph for codebase understanding"
  homepage "https://noumenon.leifericf.com"
  license "MIT"
  version "0.8.0"

  on_macos do
    url "https://github.com/leifericf/noumenon/releases/download/v0.8.0/noum-macos-arm64"
    sha256 "7e2b8b1ab0e173a6d4153f52becc676e0fe33d4e679801a8ff01e90b3001882e"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/leifericf/noumenon/releases/download/v0.8.0/noum-linux-arm64"
      sha256 "9ee0fffa97ff626abe4909e8cd2003074ec2b15604d6e693c2a911ec0f549e27"
    else
      url "https://github.com/leifericf/noumenon/releases/download/v0.8.0/noum-linux-x86_64"
      sha256 "aa91dcc49fdccf9fa66bc535e2620643c40d9842b5c1d2d0b8d7836b83e7e0ee"
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
