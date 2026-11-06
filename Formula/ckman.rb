class Ckman < Formula
  desc "ckman: CanoKey management CLI"
  homepage "https://github.com/canokeys/canokey-manager"
  version "0.2.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.2/ckman-aarch64-apple-darwin.tar.xz"
      sha256 "fbc4e961dd8eaf3d35ad686ce41d449168549624be806d9b46dbc92bc8a9a429"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.2/ckman-x86_64-apple-darwin.tar.xz"
      sha256 "a4a4b309a17d446a506f54e113c01ec8404c9c4596078a244e6852391cd98b3b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.2/ckman-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "42232d9b3f3a6b5146c6d40c4c7afd75b9ace06966c972e89938170e2f4b33e2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.2/ckman-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "87ae0e8eaab66eff59361ff85d49af77e4fc1b9991e18ce6605d249f3bf27f49"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ckman"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "ckman"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "ckman"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "ckman"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
