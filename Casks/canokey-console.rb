cask "canokey-console" do
  version "1.3.4"
  sha256 "89c3540dfb2702a3f585d5680528e72e4cacba983868f64d8cfaa275c8b03129"

  url "https://github.com/canokeys/canokey-console/releases/download/v#{version}/canokey-console-#{version}-macos.zip"
  name "CanoKey Console"
  desc "Manage CanoKey security keys"
  homepage "https://canokeys.org/"

  depends_on macos: :monterey

  app "CanoKeys Console.app"
end
