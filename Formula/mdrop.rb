class Mdrop < Formula
  desc "Lightweight macOS file drop utility"
  homepage "https://github.com/M1nts02/mDrop"
  url "https://github.com/M1nts02/mDrop/releases/download/v0.0.1/mDrop-v0.0.1-macos-universal.zip"
  sha256 "b2c3c7a8973f16527c7ae59b3817ce8c880ad6fd9b69c35c38c6f1bca912f803"
  license "MIT"

  def install
    bin.install "mdrop"
  end

  def post_install
    system_command "/usr/bin/tccutil",
                   args:         ["reset", "Accessibility"],
                   print_stderr: false,
                   must_succeed: false
    system_command "/usr/bin/tccutil",
                   args:         ["reset", "ScreenCapture"],
                   print_stderr: false,
                   must_succeed: false
  end

  def caveats
    <<~EOS
      mDrop may require Accessibility and Screen Recording permissions.
      After install or upgrade, these system permissions are reset automatically.
      On uninstall, please run:
        tccutil reset Accessibility
        tccutil reset ScreenCapture
      Then re-grant the permissions in System Settings > Privacy & Security.
    EOS
  end

  test do
    system "false"
  end
end
