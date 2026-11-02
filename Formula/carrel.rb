# Written by carrel's release workflow (packaging/homebrew.sh); edits here are overwritten.
class Carrel < Formula
  desc "Research paper library for you and your AI"
  homepage "https://arunoruto.github.io/carrel"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/arunoruto/carrel/releases/download/v0.5.0/carrel-v0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "fb4336d631839808f4c1154ad0e56df583eb81d5248db6f1442f251a1dbffc85"
  end
  on_linux do
    on_intel do
      url "https://github.com/arunoruto/carrel/releases/download/v0.5.0/carrel-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1581ade8a310e62de780d353b966b23351e0b4a1ce6956dd9c45ad7ebcd42b39"
    end
    on_arm do
      url "https://github.com/arunoruto/carrel/releases/download/v0.5.0/carrel-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "020d20a977d28febef2d86cd6e6bcb84fc31994da7e53c8c10a7919b13f61ae1"
    end
  end

  # Runs the text extractor (PyMuPDF), so papers get their text without further setup.
  depends_on "uv"

  def install
    bin.install "carrel"
  end

  def caveats
    <<~EOS
      Run carrel in the background (the web UI, and papers from Downloads):
        carrel service install web
        carrel service install consume
      The full setup (search, Docling, recommendations): https://arunoruto.github.io/carrel/docs/setup/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/carrel --version")
  end
end
