class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.10.1"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.1/cuet-0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "836447a524e5080b0a5dbce4c7058c67ab9d8ef792c0d6a5902520177f017937"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.1/cuet-0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "7924d7f1e5bc82d40f79ba23da4f147e5e05d0257cdb2294d6f1d5e7e965fc14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.1/cuet-0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d92e315e339363cfd7c368ca7f4278eb084ad46ad2ef5eda00c09d55743565bd"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.10.1/cuet-0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32be183bf852e6d050d759c27a4167664e15621acdfe4baaeab63b00d43f5764"
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
