cask "gitignore" do
  version "1.8.1"

  on_arm do
    url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-arm64.tar.gz"
    sha256 "dacbf1b66450afb40ca6eb4886922860ea4b2775c127f4ad0bfb00c9cadec7b6"
  end

  on_intel do
    url "https://github.com/convergent-systems-co/gitignore/releases/download/v#{version}/gitignore-v#{version}-darwin-amd64.tar.gz"
    sha256 "9e527075a16d61ed5162b10b3aded409caeb8744760ace79b9e5b9edbca50010"
  end

  name "gitignore"
  desc "CLI tool for managing .gitignore files from templates"
  homepage "https://github.com/convergent-systems-co/gitignore"

  binary "gitignore"
end
