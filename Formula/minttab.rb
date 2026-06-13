class Minttab < Formula
  desc "macOS window switcher with group support"
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.4/MintTab-v0.0.4-macos-arm64.zip"
  sha256 "ee8fea81126fe44ce7417486c4901f79dd10d681ab31a3fedda0d5a0b393f3aa"
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

