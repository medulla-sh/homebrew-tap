class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.4.2"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.2/cuet-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "d669c9509c5a919695136ec5911563990b5132985008a9412ab9498457cd836c"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.2/cuet-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "1e68dca12bf7854d9db765c8527739b0cc10d766b04bb00d98b58d8c6a5fe178"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.2/cuet-0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdf4feb3ae32012367f940f67da2726323d62f4aeeda58626b0df2a3f89855bf"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.4.2/cuet-0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d3ecf0adb0560eae3cd09a95fbe64245bf498593f5c42f9258362adad87b689"
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
