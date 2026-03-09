class Gitignore < Formula
  desc "CLI tool for managing .gitignore files from templates"
  homepage "https://github.com/convergent-systems-co/gitignore"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-arm64.tar.gz"
      sha256 "854da361b50275d067d73eed8d38efb8b814c218f5a1029debe17c6c0f6879cc"
    end

    on_intel do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-amd64.tar.gz"
      sha256 "25b89b376b2d1d79f6faba42244614073286d87a55ba59e12aad90b26225f71b"
    end
  end

  def install
    bin.install "gitignore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitignore --version")
  end
end
