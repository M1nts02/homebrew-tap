# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Minttab < Formula
  desc "A macOS window management tool, vibe coding project, for personal use."
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.1/MintTab-v0.0.1-macos-arm64.zip"
  sha256 "05e4182c447d1d5147b3b482ce814c7d985ceb4624bb1f84e2a843fccbd04cd1"
  license "MIT"

  def install
    bin.install "minttab"
  end

  test do
    system "false"
  end
end
