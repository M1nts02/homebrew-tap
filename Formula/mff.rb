class Mff < Formula
  desc "GUI fuzzy finder (Spotlight-style) for files and stdin"
  homepage "https://github.com/M1nts02/mff"
  url "https://github.com/M1nts02/mff/releases/download/v0.0.2/mff-0.0.2-macosx-universal.zip"
  sha256 "5626cef78940540e38e7bc833f595d571fb7681e1844c3904c8182a55e1614c8"
  license "MIT"

  def install
    bin.install "mff"
  end

  test do
    system "#{bin}/mff", "--version"
  end
end
