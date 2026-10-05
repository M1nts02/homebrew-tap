class Mff < Formula
  desc "GUI fuzzy finder (Spotlight-style) for files and stdin"
  homepage "https://github.com/M1nts02/mff"
  url "https://github.com/M1nts02/mff/releases/download/v0.0.1/mff-0.0.1-macosx-universal.zip"
  sha256 "98c6ed7b9806311a7e97f466c147ddee1d1a1e64fde23677842fe815ef1ec035"
  license "MIT"

  def install
    bin.install "mff"
  end

  test do
    system "#{bin}/mff", "--version"
  end
end
