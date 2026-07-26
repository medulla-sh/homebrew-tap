class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.5.0"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.5.0/cuet-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "13d5117e9b6295e99fd830b6058c788425cabff3d871492bea2eaa88efe832e6"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.5.0/cuet-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "3be7267aae91041b31f491bfd234d03685a6d96ab69b368d18a203b81410dfbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.5.0/cuet-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cbc8e732eb12ae298c6aa87ae559c994abdac5bcb3ea90f387ad40e76202c3b3"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.5.0/cuet-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6757ba7d27b036642f56eb189b09c3ac3c6de39ad08033b83ab5988658544522"
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
