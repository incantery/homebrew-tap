# Written by app/release in incantery/warlock at each release.
cask "warlock" do
  version "0.1.0"
  sha256 "2df07529d97bc8c74676a4c9a7578e4dd9024062820aaa0b671f0384593b84dd"

  # The release is on a private repo: Homebrew fetches it as you, with
  # HOMEBREW_GITHUB_API_TOKEN (a token that can read incantery/warlock).
  url "https://api.github.com/repos/incantery/warlock/releases/assets/768889955",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
      ]
  name "Warlock"
  desc "Terminal for the work and agents warlock keeps on your machine"
  homepage "https://github.com/incantery/warlock"

  livecheck do
    skip "Written at each release."
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Warlock.app"
  binary "#{appdir}/Warlock.app/Contents/MacOS/warlock-desktop", target: "warlock-app"
end
