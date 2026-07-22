class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.4.0"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.0/cuet-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "eee21f078f3de56873a20a2b46da20ba11eb8f2b6e7bb4a6c942e814a1f9cfd6"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.0/cuet-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "4ff58934da005f9bcc32b4948a71ef270e742ca1eac850e5812a6a2c61be998a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.0/cuet-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08ae0012d4ecfec95ded1622ec5c04e7066c45d5e8b2f442394d025b15acde44"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.0/cuet-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9dfbdd656c37a592feb3b73b24af108cc9e65e7f58b36edf948c3c37e76349d6"
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
