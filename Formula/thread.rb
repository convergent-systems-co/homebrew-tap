# typed: false
# frozen_string_literal: true

# Thread is the Obsidian-backed memory and resume CLI formula.
class Thread < Formula
  desc "Obsidian-backed memory and resume CLI for AI-assisted work"
  homepage "https://github.com/convergent-systems-co/thread"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v0.1.6/thread_0.1.6_darwin_arm64.tar.gz"
      sha256 "cf12533d14f9f187e6d41850332bf1808bebcd814669907cfd4030c3b77b9987"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v0.1.6/thread_0.1.6_darwin_amd64.tar.gz"
      sha256 "149532a0e8d9207b4bf9320ac85bf44b50aba26a0fd93040c993df58ffef7b1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v0.1.6/thread_0.1.6_linux_arm64.tar.gz"
      sha256 "7dc08b53b5e98c02e02e90d0ac4187766dda832850feab0715437ba410b29a14"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v0.1.6/thread_0.1.6_linux_amd64.tar.gz"
      sha256 "3e61d0bbe20ec45418ea629a467cfcd9fe9ec3e4c3854b6cb04be8c45fa1b918"
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
