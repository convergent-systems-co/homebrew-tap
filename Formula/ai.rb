class Ai < Formula
  desc "Polliard governance stack bootstrap binary"
  homepage "https://convergent-systems-co.github.io/ai/"
  version "0.4.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-darwin-arm64"
      sha256 "9ab7f19b74427831c27fd5dbe2acdb86c0849a917a10b8c6e1855add020a0681"

      def install
        bin.install "ai-darwin-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-darwin-amd64"
      sha256 "289157af4f5ec706239cb19ba8865ddd1f3051b533077bb4ccbfe916eae110eb"

      def install
        bin.install "ai-darwin-amd64" => "ai"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-linux-arm64"
      sha256 "29bc4755e3be2c9e26d87b0ef8f74ba1fcf10f8675c0ac75085f7741bc5edbda"

      def install
        bin.install "ai-linux-arm64" => "ai"
      end
    else
      url "https://github.com/convergent-systems-co/ai/releases/download/v0.4.0/ai-linux-amd64"
      sha256 "922beb89fae52ced42505f72378cd1c4be183bf5aea5989eb5c0f835ba7aebb1"

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
