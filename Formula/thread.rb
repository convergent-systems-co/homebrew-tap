# typed: false
# frozen_string_literal: true

class Thread < Formula
  desc "Obsidian-backed memory and resume CLI for AI-assisted work"
  homepage "https://github.com/convergent-systems-co/thread"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_arm64.tar.gz"
      sha256 "3723191af2f155afa185621d7be988e0b32334d636135c7dea5dd85e80e7a323"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_darwin_amd64.tar.gz"
      sha256 "5265196ca6dc1a04321c163bb0bacbf393c06d15288eb6aa91b9e298266c88a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_arm64.tar.gz"
      sha256 "715d75f68a26b5d865e5da4dbc1f92800a42fe815a089b9f4e885fde22fe6c11"
    end
    on_intel do
      url "https://github.com/convergent-systems-co/thread/releases/download/v#{version}/thread_#{version}_linux_amd64.tar.gz"
      sha256 "117075a3d3f78994667a8394de9c095f67df42c04f0c6336230bd7876ccd4146"
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
