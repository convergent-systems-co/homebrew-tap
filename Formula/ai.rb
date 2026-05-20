class Ai < Formula
  desc "Polliard governance stack bootstrap binary"
  homepage "https://convergent-systems-co.github.io/ai/"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-darwin-arm64"
      sha256 "fcfbe0c25a21dbc10cc1feccc00b2c44264b96ae1e070c372e3f51dabbbcc607"

      def install
        bin.install "ai-darwin-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-darwin-amd64"
      sha256 "497be3540b449f9a83477bc94ca7566f2bd7b80849ebdf73ca8d63f580209b86"

      def install
        bin.install "ai-darwin-amd64" => "ai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-linux-arm64"
      sha256 "8d971f1f2d9ca4436395d6bf24c9d3dbd18d163173b4c50cc38ae7562d870aa5"

      def install
        bin.install "ai-linux-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-linux-amd64"
      sha256 "3a877ad1f6a7a19b639e145a571deed4e2b49669b19e414cd2c08df0bfefa9fe"

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
