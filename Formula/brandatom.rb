# Homebrew formula for brandatom.
#
# DRAFT. Placeholder URL/SHA values are filled in by the release workflow
# (see .github/workflows/brandatom-release.yml). The cross-repo push to
# convergent-systems-co/homebrew-tap is intentionally manual — see the
# TODO in that workflow.
class Brandatom < Formula
  desc "Command-line client for brand-atoms.com — browse and apply brand kits"
  homepage "https://brand-atoms.com"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/branding-library/releases/download/brandatom-v#{version}/brandatom-darwin-arm64.tar.gz"
      sha256 "2dd838dcb02867e7312afa94f5b8cc7f77f713f624f46b7278de6f960f201b6f"
    else
      url "https://github.com/convergent-systems-co/branding-library/releases/download/brandatom-v#{version}/brandatom-darwin-amd64.tar.gz"
      sha256 "2c04e47938db77bc349aa7c96bb3404e02f5a787dff21d8e77d4b5ea25ec88bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/branding-library/releases/download/brandatom-v#{version}/brandatom-linux-arm64.tar.gz"
      sha256 "2b60ea85c5f6859a27071cb158023278dc117e91ed1b3459019fb6f13f1e59cf"
    else
      url "https://github.com/convergent-systems-co/branding-library/releases/download/brandatom-v#{version}/brandatom-linux-amd64.tar.gz"
      sha256 "9e044900006fc9ab0957734c85fd3a93f010247f9f968faa38eeb3d9122234b1"
    end
  end

  def install
    bin.install "brandatom"
  end

  test do
    assert_match "brandatom #{version}", shell_output("#{bin}/brandatom --version")
  end
end
