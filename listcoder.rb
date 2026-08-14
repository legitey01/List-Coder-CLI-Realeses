# typed: false
# frozen_string_literal: true

class Listcoder < Formula
  desc "ListCoderCLi - terminal-native AI coding assistant"
  homepage "https://github.com/legitey01/List-Coder-CLI-Realeses"
  version "0.1.6"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v#{version}/listcoder-x86_64-unknown-linux-gnu"
      sha256 "f6d1e00f9a7142666b4891d6f10d2bd1c4635e313c4dba1257335753a67a0669"
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