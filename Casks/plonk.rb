cask "plonk" do
  version "0.0.3"
  sha256 "24c5053675a6cb66a39aaf188a194b864c5fea082c6b8f0d16bc49c1ffe6d468"

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
