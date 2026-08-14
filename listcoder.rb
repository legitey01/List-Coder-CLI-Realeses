# typed: false
# frozen_string_literal: true

class Listcoder < Formula
  desc "ListCoderCLi - terminal-native AI coding assistant"
  homepage "https://github.com/legitey01/List-Coder-CLI-Realeses"
  version "0.1.11"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v#{version}/listcoder-x86_64-unknown-linux-gnu"
      sha256 "5bf8070e2aa154ab361412f2a08734435772891e0f7a53853ff2e4a45a73e205"
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