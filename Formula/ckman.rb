class Ckman < Formula
  desc "ckman: CanoKey management CLI"
  homepage "https://github.com/canokeys/canokey-manager"
  version "0.1.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.7/ckman-aarch64-apple-darwin.tar.xz"
      sha256 "2b6962790b5cfe8be4286df37fd64fb4f2e108f595833275885a129d6c4a317f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.7/ckman-x86_64-apple-darwin.tar.xz"
      sha256 "b8e397ddb5019cdac24eb4188823cf09ac0f40040d9ae6a19a2f5453d101843a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.7/ckman-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f76026a8f1deb740d7976cf399afd4d3fa02242aec1c564c2b1cf6745563de66"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.7/ckman-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b4a13374f86322cdab822636cdc9538cd2d036543857a8c3316af400bacb5cf5"
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
