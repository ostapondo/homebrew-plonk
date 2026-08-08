cask "plonk" do
  version "0.0.5"
  sha256 "763e020b1c531d9d6636cb0a909bb2fe6da8887269d776eac68043dcdb032685"

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

      0.0.5 is signed with a different certificate than 0.0.4, so macOS treats
      it as a new app and asks for both permissions again. This is the only
      release that does.

      Builds from 0.0.5 on are made on GitHub's runners and carry a provenance
      attestation, so you can check where this one came from before trusting
      it with any of that:

        gh attestation verify \\
          $(brew --cache)/downloads/*--Plonk-#{version}.zip \\
          -R ostapondo/plonk
    EOS
  end
end
