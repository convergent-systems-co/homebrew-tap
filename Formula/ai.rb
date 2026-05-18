class Ai < Formula
  desc "Polliard governance stack bootstrap binary"
  homepage "https://convergent-systems-co.github.io/ai/"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-darwin-arm64"
      sha256 "a807246f6b63cdce630b6118e9943ca8a800c38be7ac30c301b8fa3e610d8df3"

      def install
        bin.install "ai-darwin-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-darwin-amd64"
      sha256 "0913493feb531bd1c08fcd1ae84f8196e41a08f92142419fd271db3f88830938"

      def install
        bin.install "ai-darwin-amd64" => "ai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-linux-arm64"
      sha256 "6f4a2716f32a744a36e9fff2d8164082ea9bc4fce7506648cdfeb66598b284fa"

      def install
        bin.install "ai-linux-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.1/ai-linux-amd64"
      sha256 "83dabd0044de544a390c90e8f0a88c296663e5e9312db49a191f4756196d0bb3"

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
