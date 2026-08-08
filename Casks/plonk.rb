cask "plonk" do
  version "0.1.0"
  sha256 "4172c2237228f38b788e97a6bc9a08e2b06a9f02804dd98c1806b6a51123398c"

  url "https://github.com/ostapondo/plonk/releases/download/v#{version}/Plonk-#{version}.zip"
  name "Plonk"
  desc "Window manager with snap zones and workspaces that reopen your apps"
  homepage "https://github.com/ostapondo/plonk"

  depends_on macos: :ventura

  app "Plonk.app"

  # Plonk is signed, but with a self-signed certificate rather than a Developer
  # ID, so Gatekeeper holds it on first launch and sends the user to System
  # Settings to say Open Anyway. Clearing the quarantine flag skips that.
  #
  # This is a check being skipped on someone's behalf, so it is worth being
  # straight about the trade: what Gatekeeper offers here is Apple's opinion of
  # a build it has never seen, and what replaces it is the attestation in the
  # caveats below, which ties this exact archive to the commit and the workflow
  # run that produced it. That is a stronger claim, but only if it gets run.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Plonk.app"]
  end

  zap trash: "~/Library/Application Support/Plonk"

  caveats do
    <<~EOS
      Grant Accessibility when asked, then relaunch — macOS only picks the
      grant up on a fresh start. Screen Recording is asked for separately, the
      first time you take a screenshot.

      That is a lot to hand an app macOS cannot vouch for, and it cannot:
      Plonk is signed, but not notarized. So check where this build came from
      before granting either — it was made on GitHub's runners and carries a
      provenance attestation naming the commit it was built from:

        gh attestation verify \\
          $(brew --cache)/downloads/*--Plonk-#{version}.zip \\
          -R ostapondo/plonk

      This install skipped the Gatekeeper prompt by clearing the quarantine
      flag. The command above is the check worth doing instead.
    EOS
  end
end
