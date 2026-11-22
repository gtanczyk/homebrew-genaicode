cask "genaicode" do
  arch arm: "arm64", intel: "x86_64"

  version "2.52.0"
  sha256 arm:   "83b058d30f82f62375003fd557b1d15cfed3e36b1a42d09753084ba012fd43c7",
         intel: "f3b472c2f5a27634401ff772b100211f8be9bc980fa4fcf94e4c2d3e853b54e0"

  url "https://github.com/gtanczyk/genaicode/releases/download/v#{version}/genaicode-#{version}-macos-#{arch}.dmg",
      verified: "github.com/gtanczyk/genaicode/"
  name "Genaicode"
  desc "Desktop app for the coding agents you already have"
  homepage "https://grzegorz.tanczyk.pl/genaicode/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app offers its own updates and installs them when told to.
  auto_updates true
  depends_on macos: ">= :ventura"

  app "Genaicode.app"

  zap trash: [
    "~/Library/Application Support/pl.tanczyk.grzegorz.genaicode",
    "~/Library/Caches/pl.tanczyk.grzegorz.genaicode",
    "~/Library/Preferences/pl.tanczyk.grzegorz.genaicode.plist",
    "~/Library/Saved Application State/pl.tanczyk.grzegorz.genaicode.savedState",
    "~/Library/WebKit/pl.tanczyk.grzegorz.genaicode",
  ]
end
