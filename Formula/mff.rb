class Mff < Formula
  desc "GUI fuzzy finder (Spotlight-style) for files and stdin"
  homepage "https://github.com/M1nts02/mff"
  url "https://github.com/M1nts02/mff/releases/download/v0.0.6/mff-0.0.6-macosx-universal.zip"
  sha256 "e21f1b1fb6034e0c69c663ce67479b48309e451b2eeffa76414c75692cf3c41c"
  license "MIT"

  def install
    bin.install "mff"
  end

  service do
    run [opt_bin/"mff", "--index-daemon"]
    # The index is per-user state under ~/Library/Application Support/mff/index,
    # so the daemon must run as the logged-in user (which brew services does)
    # without inheriting the launchd context from the installer.
    environment_variables HOME: Dir.home
    keep_alive crashed: true
    process_type :background
    # Per-user log location; var/ is not writable by the user-level job on
    # Intel Macs and is not the right place for user state anyway.
    log_path "#{Dir.home}/Library/Logs/mff/index-daemon.log"
    error_log_path "#{Dir.home}/Library/Logs/mff/index-daemon.log"
  end

  def post_install
    (Pathname(Dir.home)/"Library/Logs/mff").mkpath
  end

  def caveats
    <<~EOS
      The index daemon can run as a launchd service:
        brew services start mff
      and stop with:
        brew services stop mff
      Logs are written to:
        ~/Library/Logs/mff/index-daemon.log

      Without a service, start it manually:
        mff --index-daemon
    EOS
  end

  test do
    system "#{bin}/mff", "--version"
  end
end
