# Written by carrel's release workflow (packaging/homebrew.sh); edits here are overwritten.
class Carrel < Formula
  desc "Research paper library for you and your AI"
  homepage "https://arunoruto.github.io/carrel"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/arunoruto/carrel/releases/download/v0.3.0/carrel-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "8500b6aee48b60652bd41ac756b7547cb355f11f9c70e6264d2361bba5c0186c"
  end
  on_linux do
    on_intel do
      url "https://github.com/arunoruto/carrel/releases/download/v0.3.0/carrel-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ddb778abc99b071fa30ba5d881f96219a81ff1b9b2ee79e0c50cc886032a6661"
    end
    on_arm do
      url "https://github.com/arunoruto/carrel/releases/download/v0.3.0/carrel-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9f65eaf5b1fbc7d334f3c8124cfcd7e4ad2a831f34fecd29d4a1e11322564bc4"
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
