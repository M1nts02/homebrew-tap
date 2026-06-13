class Minttab < Formula
  desc "macOS window switcher with group support"
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.3/MintTab-v0.0.3-macos-arm64.zip"
  sha256 "44031e602cd4d37d53ad56a9bdbbfb2f4e955b75436fc61dca3b7ae8938b20cd"
  license "MIT"

  depends_on :macos => :ventura

  def install
    bin.install "minttab"
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

  test do
    assert_match "MintTab", shell_output("#{bin}/minttab --help 2>&1 || true")
  end
end

