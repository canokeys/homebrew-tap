cask "canokey-console" do
  version "1.3.5"
  sha256 "15a8f1165cd0d0bf940cf59b7adcfb89c1acfc4f2f9685c86d56e034149aed0a"

  url "https://github.com/canokeys/canokey-console/releases/download/v#{version}/canokey-console-#{version}-macos.zip"
  name "CanoKey Console"
  desc "Manage CanoKey security keys"
  homepage "https://canokeys.org/"

  depends_on macos: :monterey

  app "CanoKeys Console.app"
end
