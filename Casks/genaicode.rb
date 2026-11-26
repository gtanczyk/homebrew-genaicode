cask "genaicode" do
  arch arm: "arm64", intel: "x86_64"

  version "3.6.0"
  sha256 arm:   "96dc58b253ea81e46f0662030015b65b22a78d8cd4807882dc9585354546da17",
         intel: "fd4b98c1cd3ebdb78f87e3ea24aa160e239147b1e38d981fdfdee82a06cc0e8d"

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
