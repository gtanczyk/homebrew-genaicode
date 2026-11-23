cask "genaicode" do
  arch arm: "arm64", intel: "x86_64"

  version "2.54.0"
  sha256 arm:   "c026b46159892429ba431a73b6a200c283af129821ffa02ae90d7cbb7f5a455a",
         intel: "be863c57b229866356935c12ead6cf5bab3102111166988a99c3e84fe42bb84e"

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
