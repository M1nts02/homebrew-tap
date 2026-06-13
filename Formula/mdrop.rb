class Mdrop < Formula
  desc "Lightweight macOS file drop utility"
  homepage "https://github.com/M1nts02/mDrop"
  url "https://github.com/M1nts02/mDrop/releases/download/v0.0.2/mdrop-v0.0.2-macos-universal.zip"
  sha256 "095f57eb03aa2d6e82d2627b3d7db90e23188b01a2e5eba1473bf24ec13777b9"
  license "MIT"

  def install
    bin.install "mdrop"
  end

  def caveats
    <<~EOS
      mDrop may require Accessibility and Screen Recording permissions.
      Homebrew's sandbox prevents these permissions from being reset
      automatically, so after install or upgrade please run:
        tccutil reset Accessibility
        tccutil reset ScreenCapture
      Then re-grant the permissions in System Settings > Privacy & Security.
      Run the same commands on uninstall before removing the app.
    EOS
  end

  test do
    system "#{bin}/mdrop", "--help"
  end
end


