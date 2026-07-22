class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "$version"

  on_macos do
    if Hardware::CPU.arm?
      url "$macos_arm_url"
      sha256 "$macos_arm_sha256"
    else
      url "$macos_x86_url"
      sha256 "$macos_x86_sha256"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "$linux_arm_url"
      sha256 "$linux_arm_sha256"
    else
      url "$linux_x86_url"
      sha256 "$linux_x86_sha256"
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
