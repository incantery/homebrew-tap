# Written by app/release in incantery/warlock at each release.
cask "warlock" do
  version "0.2.4"
  sha256 "a882120a3cf6f347e994e584f027209584d569a12872d6275a092dedb528afad"

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
