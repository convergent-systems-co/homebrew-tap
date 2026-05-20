class Ai < Formula
  desc "Polliard governance stack bootstrap binary"
  homepage "https://convergent-systems-co.github.io/ai/"
  version "0.4.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-darwin-arm64"
      sha256 "aac115ecf851deaad3beb8f14488ef47a52001861d118c2eb9cdf873a19a9398"

      def install
        bin.install "ai-darwin-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-darwin-amd64"
      sha256 "b516b49bebd82c98848848460b7878478d33bd6d4d1ccc8c98cd9bf905b2e3de"

      def install
        bin.install "ai-darwin-amd64" => "ai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-linux-arm64"
      sha256 "5882c20bf78d0af050b453a2d7be4db3d469f1efa5ba36bf0efaebf5ee54f73e"

      def install
        bin.install "ai-linux-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-linux-amd64"
      sha256 "bdf4b1e15860b08c05b0adb0771b4bf47b8726d89cfe19c102528a6ec1ae1d56"

      def install
        bin.install "ai-linux-amd64" => "ai"
      end
    end
  end

  def caveats
    <<~EOS
      The `ai` binary is unsigned. On first run, macOS Gatekeeper may
      block execution. To clear the quarantine attribute:

        xattr -d com.apple.quarantine "#{bin}/ai"

      Code signing is a tracked follow-up.
    EOS
  end

  test do
    assert_match "ai #{version}", shell_output("#{bin}/ai version")
  end
end
