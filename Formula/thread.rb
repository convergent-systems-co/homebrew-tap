# typed: false
# frozen_string_literal: true

class Thread < Formula
  desc "Obsidian-backed memory and resume CLI for AI-assisted work"
  homepage "https://github.com/convergent-systems-co/thread"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_arm64.tar.gz"
      sha256 "1152a7a1df1cc5982a87c5daaf465e2f1956e01e01cbbef20bcb117330a383b6"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_amd64.tar.gz"
      sha256 "9983e335227f3f46dcacf41491a17eca46129881e445e353b1ad38366b0837cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_arm64.tar.gz"
      sha256 "689e61e5f082f2c50ea3c10432e961a01958d39730c439715844dc7a5875431b"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_amd64.tar.gz"
      sha256 "7ec1429224a081aaf55eb3d78efd4f7df57a404c4ffa0c9e70347dfb43a1e09e"
    end
  end

  def install
    bin.install "thread"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/thread --version").strip
  end
end
