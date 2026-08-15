class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.9.2"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.2/cuet-0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "99e9d914f053dc182acd83c828483fcc648048be1299d15b7e421c7120275bb4"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.2/cuet-0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "217b6d24ceda168c5066ed841b9725c4ea61721f4a34e753bd85a0a03f032422"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.2/cuet-0.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85eae1f187cc596ac5be456a35ae2b92af3130570489ed74fe65ed4e5b0e32cb"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.2/cuet-0.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ed0b42fa9224d86799665b426f3147a7211e0a8ee71366b2e9d9c949286164a"
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
