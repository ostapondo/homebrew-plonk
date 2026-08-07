cask "plonk" do
  version "0.0.4"
  sha256 "dc4da4540b3de2e45de70b7180e5c3a2d4eb141fc90969ee5f75d1d8eda177d0"

  url "https://github.com/ostapondo/plonk/releases/download/v#{version}/Plonk-#{version}.zip"
  name "Plonk"
  desc "Window manager with snap zones and workspaces that reopen your apps"
  homepage "https://github.com/ostapondo/plonk"

  depends_on macos: :ventura

  app "Plonk.app"

  zap trash: [
    "~/Library/Application Support/Plonk",
  ]

  caveats do
    <<~EOS
      First launch takes one extra click. Plonk is code-signed but not
      notarized, so macOS holds it once: open Plonk, dismiss the warning, then
      System Settings > Privacy & Security > Open Anyway.

      Grant Accessibility when asked, then relaunch — macOS only picks the
      grant up on a fresh start. Screen Recording is asked for separately, the
      first time you take a screenshot.
    EOS
  end
end
