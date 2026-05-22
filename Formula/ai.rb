class Ai < Formula
  desc "Polliard governance stack bootstrap binary"
  homepage "https://convergent-systems-co.github.io/ai/"
  version "0.6.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.6.0/ai-darwin-arm64"
      sha256 "09b21b6846d33961714eb94d9fda0587264ee2c9fc8d7dfd1d659334272455ef"
    else
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.6.0/ai-darwin-amd64"
      sha256 "d85882bf9db995e8ac6237508a1987d063a5a58dcbbdc9611d43e3158addc5bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.6.0/ai-linux-arm64"
      sha256 "e8e4466da8cda2ac9c9bc437ce5f3d9adf96b1b6e7fd5aed5178d8e601e1ff9e"
    else
      url "https://pub-c1020ffe9811429797840212d4437655.r2.dev/v0.6.0/ai-linux-amd64"
      sha256 "436f75c2eba856788212c6990acfce2dd1ec16603c8c5cb8ba3e88b539dd1dea"
    end
  end

  def install
    bin.install Dir["ai-*"].first => "ai"
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
