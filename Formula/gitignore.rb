class Gitignore < Formula
  desc "CLI tool for managing .gitignore files from templates"
  homepage "https://github.com/convergent-systems-co/gitignore"
  version "1.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-arm64.tar.gz"
      sha256 "dacbf1b66450afb40ca6eb4886922860ea4b2775c127f4ad0bfb00c9cadec7b6"
    end

    on_intel do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-amd64.tar.gz"
      sha256 "9e527075a16d61ed5162b10b3aded409caeb8744760ace79b9e5b9edbca50010"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-linux-amd64.tar.gz"
      sha256 "6cd576bc967b3c4c931a720a3a5610407e811a5cdec5d3d59cc9f332463c9518"
    end
  end

  def install
    bin.install "gitignore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitignore --version")
  end
end
