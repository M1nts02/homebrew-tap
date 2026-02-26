# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Mdrop < Formula
  desc "A lightweight macOS file drop utility."
  homepage "https://github.com/M1nts02/mDrop"
  url "https://github.com/M1nts02/mDrop/releases/download/v0.0.1/mDrop-v0.0.1-macos-universal.zip"
  sha256 "b2c3c7a8973f16527c7ae59b3817ce8c880ad6fd9b69c35c38c6f1bca912f803"
  license "MIT"

  def install
    bin.install "mdrop"
  end

  test do
    system "false"
  end
end
