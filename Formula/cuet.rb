class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.3.0/cuet-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "fa0aeae65f8c4c98f115e678a308f6d76c6babf5ffebce88179254ae659fc11c"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.3.0/cuet-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a95ff92d6ebfd6b5122216611fe3cbe3b84f80e0a0b4a3a3c7fb5b619fe9668d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.3.0/cuet-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d083960f77784ef6a6f576afa212a6e7402565478a59a5e1b866c549a4658a6"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.3.0/cuet-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8855e37d2f9d20636426c18f7c0524e9216b12f28c700cf4d87109198379a155"
    end
  end

  def install
    bin.install "cuet"
  end

  test do
    system "#{bin}/cuet", "--help"
  end
end
