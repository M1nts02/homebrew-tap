class Minttab < Formula
  desc "macOS window switcher with group support"
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.9/MintTab-v0.0.9-macos-arm64.zip"
  sha256 "35b39e06f47b23e738bab4d953d6a7e1f3c28fac6aa6c67376e6f7ca96a03eea"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "minttab"
  end

  def post_install
    ["Accessibility", "ScreenCapture", "PostEvent"].each do |service|
      quiet_system "/usr/bin/tccutil", "reset", service
    end
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

