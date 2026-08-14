class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.9.1"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.1/cuet-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "861776e522292b6624a236f8c8be565258935bbf314ffac3d1e08adf0c1ded1d"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.1/cuet-0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "b96e59c7ecd0d92a6ac54f6b34265bdb45348945b327d992efb6c4c0c99743e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.1/cuet-0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5fae6cd498dacda65832fc949693abef4f6c7df4354fe79f90b3db28624b10af"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.1/cuet-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c30488fe518df48ae48b54dfbe34c9c3a401777d5de4704d69a41663dff85d4"
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
