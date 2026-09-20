class Ckman < Formula
  desc "CanoKey management CLI (device config, OATH, PIV, OpenPGP, FIDO2)"
  homepage "https://github.com/canokeys/canokey-manager"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.0/ckman-aarch64-apple-darwin.tar.xz"
      sha256 "cd292cfa78521f0aae9c4d563d7a9daedb85361e9200e9944e5f814468a31f0f"
    end
    on_intel do
      url "https://github.com/canokeys/canokey-manager/releases/download/v0.1.0/ckman-x86_64-apple-darwin.tar.xz"
      sha256 "398e7cdb77e26a247eeaa63cbdd06ac5ea6edd3a6dca57b11015bd847de367b1"
    end
  end

  def install
    bin.install "ckman"
  end

  test do
    assert_match "ckman 0.1.0", shell_output("#{bin}/ckman --version")
  end
end
