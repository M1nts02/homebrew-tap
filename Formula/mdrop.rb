class Mdrop < Formula
  desc "Lightweight macOS file drop utility"
  homepage "https://github.com/M1nts02/mDrop"
  url "https://github.com/M1nts02/mDrop/releases/download/v0.0.1/mDrop-v0.0.1-macos-universal.zip"
  sha256 "b2c3c7a8973f16527c7ae59b3817ce8c880ad6fd9b69c35c38c6f1bca912f803"
  license "MIT"

  def install
    bin.install "mdrop"
  end

  post_install do
    system_command "/usr/bin/tccutil",
                   args:         ["reset", "Accessibility"],
                   print_stderr: false,
                   must_succeed: false
    system_command "/usr/bin/tccutil",
                   args:         ["reset", "ScreenCapture"],
                   print_stderr: false,
                   must_succeed: false
  end

  uninstall_postflight do
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
      After install, upgrade, or uninstall, these system permissions are reset
      and must be re-granted in System Settings > Privacy & Security.
    EOS
  end

  test do
    system "false"
  end
end
