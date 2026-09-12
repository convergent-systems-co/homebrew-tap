# typed: false
# frozen_string_literal: true

# Thread is the Obsidian-backed memory and resume CLI formula.
class Thread < Formula
  desc "Obsidian-backed memory and resume CLI for AI-assisted work"
  homepage "https://github.com/convergent-systems-co/thread"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_arm64.tar.gz"
      sha256 "26627b4c3e9e607d6c70b5c6ee0deb29c47b2ba432893a155dd094af18e92298"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_amd64.tar.gz"
      sha256 "a294894d5b36b2a0463d5f758b4e89b43c35c51360ede40142843b08af394946"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_arm64.tar.gz"
      sha256 "34ac261e8b81fd46585258dcd88c9af8c59037152b5a882ccd8205cdcaf927c7"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_amd64.tar.gz"
      sha256 "d21fb536e3b9c4ce4a9176e5b2b609f32570c40cae79a5d986e6c844a18299aa"
    end
  end

  def install
    bin.install "thread"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/thread --version").strip
    system bin/"thread", "--vault", testpath, "capture", "Storage location check"
    assert_predicate testpath/"Thread/.items", :directory?
    refute_path_exists testpath/"Thread/Items"
  end
end
