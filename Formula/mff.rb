class Mff < Formula
  desc "GUI fuzzy finder (Spotlight-style) for files and stdin"
  homepage "https://github.com/M1nts02/mff"
  url "https://github.com/M1nts02/mff/releases/download/v0.0.5/mff-0.0.5-macosx-universal.zip"
  sha256 "e1434e7bc3d11eb0cf3ff839f583fa02f31275e438bebf8923574aaa5c5a639e"
  license "MIT"

  def install
    bin.install "mff"
  end

  test do
    system "#{bin}/mff", "--version"
  end
end
