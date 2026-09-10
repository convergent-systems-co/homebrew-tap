# typed: false
# frozen_string_literal: true

class Thread < Formula
  desc "Obsidian-backed memory and resume CLI for AI-assisted work"
  homepage "https://github.com/convergent-systems-co/thread"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_arm64.tar.gz"
      sha256 "53a4473312e516a94c854af8140ec3ca06409d13eccb8afa1d386f65158a30ba"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_amd64.tar.gz"
      sha256 "443e06002a15392a11195b89239442a9c9f1202e632d7d118a8d2820f0ecf9ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_arm64.tar.gz"
      sha256 "e14b81af3453f0f9bbe5b15bfef4783f502f09c0412668f1a3327010b391e177"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_amd64.tar.gz"
      sha256 "f1583619ff75ea4b32c672573888d0e694efcd50ab53a3fa5eaaa55377aa8080"
    end
  end

  def install
    bin.install "thread"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/thread --version").strip
    system bin/"thread", "--vault", testpath, "capture", "Storage location check"
    assert_predicate testpath/"Thread/.items", :directory?
    refute_predicate testpath/"Thread/Items", :exist?
  end
end
