class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.10.0"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.0/cuet-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "8c52651e513cd1d7505e7cf0e46fea96c3b297990721523d11bbe5133711cf8d"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.0/cuet-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "80943c77fe084d318fa77423ac2fadb8ce99cf502ee24047d2be77841a1c7721"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.0/cuet-0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9cc43faafb2b07810d2e05bf944387ff0c10f3742b2bbf1cd112c2668c926af4"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.0/cuet-0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd3cb842a9f83c367843daa4fa743ddd462223b1797c44642333a04efb8888fe"
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
