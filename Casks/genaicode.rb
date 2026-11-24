cask "genaicode" do
  arch arm: "arm64", intel: "x86_64"

  version "3.3.0"
  sha256 arm:   "1b085b3756a91d1faf719b00801d37d04cd0ebc687daed4bf03325b5034f7397",
         intel: "ec003f93570ee770dc256729b9d2130697233dec5820ebd1576983d562ed02f5"

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
