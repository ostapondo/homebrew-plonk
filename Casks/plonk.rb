cask "plonk" do
  version "0.0.1"
  sha256 "994f7cf2d4af353b27794027543ff4f265d5428f02569cc77d7272cc1008ceaf"

  url "https://github.com/ostapondo/plonk/releases/download/v#{version}/Plonk-#{version}.zip"
  name "Plonk"
  desc "Mac window manager an AI agent can drive over MCP"
  homepage "https://github.com/ostapondo/plonk"

  depends_on macos: ">= :ventura"

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
