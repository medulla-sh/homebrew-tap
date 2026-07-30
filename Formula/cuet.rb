class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.6.1"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.6.1/cuet-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "7ed5f6e66be59a82162cef43156d2a376ba2a1bdd5b8a236dfda64a40583ddb0"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.6.1/cuet-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "f87a3a8a02d7b4319e3547ad0d262d27b32334d2bee53fabf29af928de73724b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.6.1/cuet-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd74ab90be604ec2f629b26d27558f7a3d2c6f8d4bb46745ca2248d246a7b9b1"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.6.1/cuet-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f57711ede4e9ccbd7d07af0a14733d23cbda5a714279993e46003666ff11adbc"
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
