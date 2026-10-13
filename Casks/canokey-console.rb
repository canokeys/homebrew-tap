cask "canokey-console" do
  version "1.2.8"
  sha256 "f3fb332774c2d374999cc66d9cb9b8b09f6be2cf44dec233b106cf313c5601d2"

  url "https://github.com/canokeys/canokey-console/releases/download/v#{version}/canokey-console-#{version}-macos.zip"
  name "CanoKey Console"
  desc "Manage CanoKey security keys"
  homepage "https://canokeys.org/"

  depends_on macos: :monterey

  app "CanoKeys Console.app"
end
