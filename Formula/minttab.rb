class Minttab < Formula
  desc "macOS window switcher with group support"
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.7/MintTab-v0.0.7-macos-arm64.zip"
  sha256 "75caca5e7bd6d1ea15bc98ccfc4eecc62e07e1ac3749d86961e70889210c8d30"
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
