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
      sha256 "bb4b97fb0e691038f0c98bb2dde4b9ebfdca7c7bd787390d7350ce3a42ff29db"
    else
      url "https://github.com/convergent-systems-co/branding-library/releases/download/brandatom-v#{version}/brandatom-darwin-amd64.tar.gz"
      sha256 "9ad238b7fd76653180056a8e025eb2b652c35718a4444c920ab3c98159b3f193"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/convergent-systems-co/branding-library/releases/download/brandatom-v#{version}/brandatom-linux-arm64.tar.gz"
      sha256 "32d90e143f8da1a6f3f88fe4906437c2378e3c415aaab2d4b99549f224e95c42"
    else
      url "https://github.com/convergent-systems-co/branding-library/releases/download/brandatom-v#{version}/brandatom-linux-amd64.tar.gz"
      sha256 "84246aef3a15af092ac45335b2c5db0d42ca8b2bee3c477910c5d032fa2e155d"
    end
  end

  def install
    bin.install "brandatom"
  end

  test do
    assert_match "brandatom #{version}", shell_output("#{bin}/brandatom --version")
  end
end
