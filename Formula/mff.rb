class Mff < Formula
  desc "GUI fuzzy finder (Spotlight-style) for files and stdin"
  homepage "https://github.com/M1nts02/mff"
  url "https://github.com/M1nts02/mff/releases/download/v0.0.4/mff-0.0.4-macosx-universal.zip"
  sha256 "2da5e77bb85644972aaa782cbfaba48ea61566407a4a38469255e17dcef2d018"
  license "MIT"

  def install
    bin.install "mff"
  end

  test do
    system "#{bin}/mff", "--version"
  end
end
