class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.9.0"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.0/cuet-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "3286b14decf830d76a7c6beb5fca0f59fc100c4d0a5a3be357171147ef7e394b"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.0/cuet-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "4dac32a3a215e6a03c318538d035ba578dbebcfd215eaeb64a8d005d2aa53d4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.0/cuet-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "488061fd61ead7d6be2a896319e8d2d62482093214e53bbcf63fffc0a97c4b34"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.0/cuet-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b3c4bb14d7be98dbcdc7d03795dda2d377d3ce7e5308eb35c9efa8a58abd5da"
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
