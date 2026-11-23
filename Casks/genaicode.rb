cask "genaicode" do
  arch arm: "arm64", intel: "x86_64"

  version "3.0.1"
  sha256 arm:   "21439c0aa5957782b0bd6b428b085feb9eeef0dddbc444e1288f3eb919002469",
         intel: "132f53720fd6e087e4bbcdd92a09aad2223ce779702bfc26e44b2b7151a7825f"

  url "https://github.com/gtanczyk/genaicode/releases/download/v#{version}/genaicode-#{version}-macos-#{arch}.dmg"
  name "Genaicode"
  desc "Desktop app for the coding agents you already have"
  homepage "https://grzegorz.tanczyk.pl/genaicode/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app offers its own updates and installs them when told to.
  auto_updates true
  # Homebrew reads a bare release as "this one or newer". The app itself needs 13.5.
  depends_on macos: :ventura

  app "Genaicode.app"

  zap trash: [
    "~/Library/Application Support/pl.tanczyk.grzegorz.genaicode",
    "~/Library/Caches/pl.tanczyk.grzegorz.genaicode",
    "~/Library/Preferences/pl.tanczyk.grzegorz.genaicode.plist",
    "~/Library/Saved Application State/pl.tanczyk.grzegorz.genaicode.savedState",
    "~/Library/WebKit/pl.tanczyk.grzegorz.genaicode",
  ]
end
