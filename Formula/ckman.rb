class Ckman < Formula
  desc "ckman: CanoKey management CLI"
  homepage "https://github.com/canokeys/canokey-manager"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.4/ckman-aarch64-apple-darwin.tar.xz"
      sha256 "e3116dcf615ef2060e201a8765e1ece34ccd883009121861fb28449da52aa569"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.4/ckman-x86_64-apple-darwin.tar.xz"
      sha256 "be7817945decdcbd1ac60b171124b4dae3cef2755663c4f20e92389cb3d44a01"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.4/ckman-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6c3047d0aced86550846261ccd9e7a4322dbf85b4298550bbb061d1976766cde"
    end
    if Hardware::CPU.intel?
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.4/ckman-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d2a79e7f03554a08fb125d12d9566b5d1455d5d89c32f6af80ebe804d638c475"
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
