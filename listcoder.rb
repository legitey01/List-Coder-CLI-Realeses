# typed: false
# frozen_string_literal: true

class Listcoder < Formula
  desc "ListCoderCLi - terminal-native AI coding assistant"
  homepage "https://github.com/legitey01/List-Coder-CLI-Realeses"
  version "0.1.13"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/legitey01/List-Coder-CLI-Realeses/releases/download/v#{version}/listcoder-x86_64-unknown-linux-gnu"
      sha256 "7ca8517609565cc26b2457ba6e5c3c792cae92d3b42b48510ad244d1df36d62b"
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