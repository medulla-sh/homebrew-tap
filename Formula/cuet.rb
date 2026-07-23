class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.4.1"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.1/cuet-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "f4e374d652e249bbeeb991b70037084533830c4872b9b8a187efe161491f2ac2"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.1/cuet-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "53df8fbfad203834787d2ce325f4c145adcd4e2f2f59bd0212e7b017e7383d80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.1/cuet-0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9269bddcd756dcb05122eea0291fb775345a513583855ca18462832affd82bde"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.1/cuet-0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9336a3697588b26c14ce21300945b35a883131bbff4db12e6063b21a7245297"
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
