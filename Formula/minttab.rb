class Minttab < Formula
  desc "macOS window switcher with group support"
  homepage "https://github.com/M1nts02/MintTab"
  url "https://github.com/M1nts02/MintTab/releases/download/v0.0.5/MintTab-v0.0.5-macos-arm64.zip"
  sha256 "b74c4ccdf3cdca274e0ad1fd40025e61a342005d12c66f2371a5863122bbdaa3"
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

