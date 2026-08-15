class Cuet < Formula
  desc "CLI for managing infrastructure deployment using the cuet framework"
  homepage "https://github.com/medulla-sh/cuet"
  version "0.9.3"

  depends_on "cue" => :recommended
  depends_on "opentofu" => :recommended
  depends_on "tfmigrate" => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.3/cuet-0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "c8a3dfe2b091600cdd84d06d15de2774c787bc8e6bab977da37ea8819dddb8fc"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.3/cuet-0.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "4735129e7d002a17ed602da8c35bb82f261b41335c1487040ec145da144ec9e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.3/cuet-0.9.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e52145179fcbd3e52df8c368a661a29b7c350555f25a914d5ecffc149e6896f1"
    else
      url "https://github.com/medulla-sh/cuet/releases/download/cli%2F0.9.3/cuet-0.9.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcb4e82329ef77f81926554b729e3122f340101448039bdfa06eb4ab2a588990"
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
