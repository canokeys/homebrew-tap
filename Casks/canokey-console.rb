cask "canokey-console" do
  version "1.3.1"
  sha256 "b78af6d5262eac43223bd209ca0970ae63c495560fca61e66ea42f74cec44beb"

  url "https://github.com/canokeys/canokey-console/releases/download/v#{version}/canokey-console-#{version}-macos.zip"
  name "CanoKey Console"
  desc "Manage CanoKey security keys"
  homepage "https://canokeys.org/"

  depends_on macos: :monterey

  app "CanoKeys Console.app"
end
