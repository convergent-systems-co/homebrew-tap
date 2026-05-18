class Ai < Formula
  desc "Polliard governance stack bootstrap binary"
  homepage "https://convergent-systems-co.github.io/ai/"
  version "0.5.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.5.0/ai-darwin-arm64"
      sha256 "e27c0911173b174e5a927b605423f053c001d234e2a185362723507e4dd7d0d3"

      def install
        bin.install "ai-darwin-arm64" => "ai"
      end
    else
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.5.0/ai-darwin-amd64"
      sha256 "1114a310b3403b326fce68a659689f896dc0a757f8e9441e6ecf7139a5f9da31"

      def install
        bin.install "ai-darwin-amd64" => "ai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.5.0/ai-linux-arm64"
      sha256 "3e31c30d03cd683de719103717bf3e7422e9cc82758d95e610f1579d85636600"

      def install
        bin.install "ai-linux-arm64" => "ai"
      end
    else
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.5.0/ai-linux-amd64"
      sha256 "efd30ee321a1617e931e0e929c7836995c6f9d4e0997f4ac4fa2153880fd8416"

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
