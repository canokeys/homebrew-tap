class Ckman < Formula
  desc "ckman: CanoKey management CLI"
  homepage "https://github.com/canokeys/canokey-manager"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.1/ckman-aarch64-apple-darwin.tar.xz"
      sha256 "81d53352c9748d4dc4ec33ed67489f5fda8fb5a41aebb8c5990b3126537d67c9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.1/ckman-x86_64-apple-darwin.tar.xz"
      sha256 "13fedb22c55d27e30fb8f44c996d6fbb5f404755de9cae1111b73dfa7728219d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.1/ckman-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "22238600e0999d7f17103a1e4b72c2bef9a5f4da1c5e8eb9911617c3f669b10a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.2.1/ckman-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3c543940c768887e18d694b2db557cf280d538bcbc600d2cd7b76542721ac870"
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
