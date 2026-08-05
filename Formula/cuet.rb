class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.7.0"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.7.0/cuet-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "5edade905417a2cb1226222385111758cbc4218fb54130021b7ed3b94fe78147"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.7.0/cuet-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "8f8228c0e281773f65325df27fbf6768183328dc0c6a735f1f6d952d82babb15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.7.0/cuet-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5f6239489fb75bd0dc3006421a5e3735886edcb7ada822b0453cd527c05df0d"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.7.0/cuet-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "feacbb9a92a0de084e22d8f586d28f170f305d4992a88588bb70487b7ed1ad9a"
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
