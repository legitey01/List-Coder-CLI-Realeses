# typed: false
# frozen_string_literal: true

class Listcoder < Formula
  desc "ListCoderCLi - terminal-native AI coding assistant"
  homepage "https://github.com/legitey01/List-Coder-CLI-Realeses"
  version "0.1.15"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v#{version}/listcoder-x86_64-unknown-linux-gnu"
      sha256 "f1535b28e47ab58ab0cc8cfa54e9d7b252691fc16967c1f1e5269aea7270eb73"
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