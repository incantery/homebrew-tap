# Written by app/release in incantery/warlock at each release.
cask "warlock" do
  version "0.2.0"
  sha256 "9912b7c05465461c28a116234a977305c4dc71a06624b7ca088ac96b852b669d"

  url "https://github.com/incantery/warlock-app/releases/download/app-v#{version}/Warlock-#{version}-arm64.zip"
  name "Warlock"
  desc "Terminal, and the warlock that keeps your work and agents running behind it"
  homepage "https://github.com/incantery/warlock-app"

  livecheck do
    skip "Written at each release."
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Warlock.app"
  binary "#{appdir}/Warlock.app/Contents/MacOS/warlock-desktop", target: "warlock-app"
  # The warlock the app brings and runs (it sets it up when first opened).
  binary "#{appdir}/Warlock.app/Contents/MacOS/warlock"

  uninstall launchctl: "com.incantery.warlock",
            quit:      "com.incantery.warlock.desktop"

  zap trash: [
    "~/.config/warlock",
    "~/.local/share/warlock",
    "~/Library/Logs/warlock.log",
  ]

  caveats "Open Warlock once: it sets up warlock to run on this Mac, and again after an upgrade."
end
