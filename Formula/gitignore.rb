class Gitignore < Formula
  desc "CLI tool for managing .gitignore files from templates"
  homepage "https://github.com/convergent-systems-co/gitignore"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-arm64.tar.gz"
      sha256 "67bb5445e70d93c082f69e8b0e68b8dc71bfc1bf3fdb85ad0de2cb102f6089ee"
    end

    on_intel do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-amd64.tar.gz"
      sha256 "e15958740bb83fa90cc1b466e754503f1f305466eaf455269619e3403029493b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-linux-amd64.tar.gz"
      sha256 "46640874e29944f61b84bbfa740832d5146f653c14250f4d82003332eaf5c879"
    end
  end

  def install
    bin.install "gitignore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitignore --version")
  end
end
