class Ckman < Formula
  desc "ckman: CanoKey management CLI"
  homepage "https://github.com/canokeys/canokey-manager"
  version "0.1.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.5/ckman-aarch64-apple-darwin.tar.xz"
      sha256 "f5c940a57d85ec8ae0e69f5063daf20955fa3f89a5857ce1d1ae58700a204956"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.5/ckman-x86_64-apple-darwin.tar.xz"
      sha256 "27e89460983b55587a0f81be3012ea29b21e610c452cd1e32044e6f5523adb77"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.5/ckman-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c1f2509a216d858c31b2ecd8348c4d84d98a231a57a6fd3e028f0d738da5c8ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.5/ckman-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "75f21d2aa737e73b3cd3adb963176d425b18662dc5d273acbc89cd3163e67591"
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
