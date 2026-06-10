class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.1.0/cuet-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "100fec83314963282ac8c9e22e3c7a04598da37353c99aec8b3171565fc5a1a4"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.1.0/cuet-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "b0374cba5558b27c3c287a0d9aefc0433417c0647d205e6f65f4703dd95e9917"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.1.0/cuet-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5463209206b70d950e807551156b744704718d07be0cb5760a3f6fdc3fa4b75"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.1.0/cuet-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd3909b17d3481dfe56eaed0bf99d0bd6b0f3202cf3f8c4b8f86a8e98655e97f"
    end
  end

  def install
    bin.install "cuet"
  end

  test do
    system "#{bin}/cuet", "--help"
  end
end
