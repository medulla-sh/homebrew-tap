class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.8.0"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.8.0/cuet-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "afd412c4d52c9d53d1e582d38164a9fb9e182c14a1f438601c8d57240aa3dc35"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.8.0/cuet-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "aba53b47effc1f7e09e8c7f9fac3add6e31d72314b1f78fdcb4af8bcc3b4ff90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.8.0/cuet-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1074e61870d5ca4e7d9fc7e6e91948a6dff76bcda95430911bc2e84880e4fbc9"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.8.0/cuet-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93f094be964ac22870f2bb04c821e78be73a70734e5e5218cb64146cbf81a5e0"
    end
  end

  def install
    bin.install "cuet"
    generate_completions_from_executable bin/"cuet", "completions"
  end

  test do
    system "#{bin}/cuet", "--help"
    assert_path_exists bash_completion/"cuet"
    assert_path_exists fish_completion/"cuet.fish"
    assert_path_exists zsh_completion/"_cuet"
  end
end
