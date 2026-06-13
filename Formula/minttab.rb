class Minttab < Formula
  desc "macOS window switcher with group support"
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.5/MintTab-v0.0.5-macos-arm64.zip"
  sha256 "b74c4ccdf3cdca274e0ad1fd40025e61a342005d12c66f2371a5863122bbdaa3"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "minttab"
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
    system_command "/usr/bin/tccutil",
                   args:         ["reset", "PostEvent"],
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
      After install, upgrade, or uninstall, these system permissions are reset
      and must be re-granted in System Settings > Privacy & Security.
    EOS
  end

  test do
    assert_match "MintTab", shell_output("#{bin}/minttab --help 2>&1 || true")
  end
end
