cask "plonk" do
  version "0.0.2"
  sha256 "298e7da63a4997ce0ae29313b26c9363a5af282c7d209ca9ff3ceaaf3a7d8935"

  url "https://github.com/ostapondo/plonk/releases/download/v#{version}/Plonk-#{version}.zip"
  name "Plonk"
  desc "Mac window manager an AI agent can drive over MCP"
  homepage "https://github.com/ostapondo/plonk"

  depends_on macos: :ventura

  app "Plonk.app"

  zap trash: [
    "~/Library/Application Support/Plonk",
  ]

  caveats do
    <<~EOS
      Plonk is not notarized yet, so macOS will block the first launch.
      Approve it under System Settings → Privacy & Security → Open Anyway,
      then grant Accessibility and relaunch.
    EOS
  end
end
