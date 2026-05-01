class Gitignore < Formula
  desc "CLI tool for managing .gitignore files from templates"
  homepage "https://github.com/convergent-systems-co/gitignore"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-arm64.tar.gz"
      sha256 "a059f5136af0cd501b6a73eff53d62d5868bd48b220f9a890829f1dd3368774b"
    end

    on_intel do
      url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-amd64.tar.gz"
      sha256 "36b8ecca88a682b9bc8faab588ae81be5589e7ac07eca15aaf9db54a43bbfac8"
    end
  end

  def install
    bin.install "gitignore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitignore --version")
  end
end
