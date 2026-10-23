cask "canokey-console" do
  version "1.3.0"
  sha256 "45c97714a36e974cec60f019d0ad653b6df0cf06b13720429d1e9be2d58acdd2"

  url "https://github.com/canokeys/canokey-console/releases/download/v#{version}/canokey-console-#{version}-macos.zip"
  name "CanoKey Console"
  desc "Manage CanoKey security keys"
  homepage "https://canokeys.org/"

  depends_on macos: :monterey

  app "CanoKeys Console.app"
end
