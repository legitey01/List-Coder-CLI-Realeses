# typed: false
# frozen_string_literal: true

class Listcoder < Formula
  desc "ListCoderCLi - terminal-native AI coding assistant"
  homepage "https://github.com/legitey01/List-Coder-CLI-Realeses"
  version "0.1.5"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v#{version}/listcoder-x86_64-unknown-linux-gnu"
      sha256 "693fa5324e67e0bf2abd18f03b9809cc9f62cb42cc0b10a21e9a37811d8d7d57"
    end
    on_arm do
      url "https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v#{version}/listcoder-aarch64-unknown-linux-gnu"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    end
  end

  def install
    bin.install "listcoder"
  end

  test do
    system "#{bin}/listcoder", "--version"
  end
end