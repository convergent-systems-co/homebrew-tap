class Gitignore < Formula
  desc "CLI tool for managing .gitignore files from templates"
  homepage "https://github.com/convergent-systems-co/gitignore"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-arm64.tar.gz"
      sha256 "22ad3caf493ed0eaffa1d8acc71830cdda030d2ef29cdfd968fa93973d045ac2"
    end

    on_intel do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-amd64.tar.gz"
      sha256 "097bc2f3191c0eb603ccdf5410acfa3b05b8038d62de2a8b4657af93383ee82e"
    end
  end

  def install
    bin.install "gitignore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitignore --version")
  end
end
