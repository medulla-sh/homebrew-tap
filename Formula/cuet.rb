class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.2.0/cuet-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c7aedfafa506b18913e85d8cb75af7bd2d05f885699769a8e4c7f5650df1ae7c"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.2.0/cuet-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a017f74e2250a71aa4d3b4fe3efddd5a1da3169c0f92eed6e89b8b03b86102bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.2.0/cuet-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "844dba03310e9f26d214d2936173fcc77c0f6fa66467ede50df8db8114e3fd35"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.2.0/cuet-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f74ba9d05c4e8cd9c2daf40fef71a86e26048bb3f8f789e5698079a35eab294"
    end
  end

  def install
    bin.install "cuet"
  end

  test do
    system "#{bin}/cuet", "--help"
  end
end
