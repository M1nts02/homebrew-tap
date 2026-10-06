class Mff < Formula
  desc "GUI fuzzy finder (Spotlight-style) for files and stdin"
  homepage "https://github.com/M1nts02/mff"
  url "https://github.com/M1nts02/mff/releases/download/v0.0.3/mff-0.0.3-macosx-universal.zip"
  sha256 "22ce92543140ef8fefca2ac2996f6553de082324a0cdef7bf1e56d75d284b96c"
  license "MIT"

  def install
    bin.install "mff"
  end

  test do
    system "#{bin}/mff", "--version"
  end
end
