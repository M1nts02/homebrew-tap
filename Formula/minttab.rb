class Minttab < Formula
  desc "macOS window switcher with group support"
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.6/MintTab-v0.0.6-macos-arm64.zip"
  sha256 "7d650a984fb035ec3036a2d7991a425689ddadbdf3259ee62b1b517d7ff2523c"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "minttab"
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
    system_command "/usr/bin/tccutil",
                   args:         ["reset", "PostEvent"],
                   print_stderr: false,
                   must_succeed: false
  end

  service do
    run [opt_bin/"minttab"]
    keep_alive true
    run_at_load true
    process_type :interactive
    log_path var/"log/minttab.log"
    error_log_path var/"log/minttab.log"
    environment_variables PATH: std_service_path_env
  end

  def caveats
    <<~EOS
      MintTab requires Accessibility, Screen Recording and Input Monitoring permissions.
      After install or upgrade, these system permissions are reset automatically.
      On uninstall, please run:
        tccutil reset Accessibility
        tccutil reset ScreenCapture
        tccutil reset PostEvent
      Then re-grant the permissions in System Settings > Privacy & Security.
    EOS
  end

  test do
    assert_match "MintTab", shell_output("#{bin}/minttab --help 2>&1 || true")
  end
end
