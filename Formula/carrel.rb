# Written by carrel's release workflow (packaging/homebrew.sh); edits here are overwritten.
class Carrel < Formula
  desc "Research paper library for you and your AI"
  homepage "https://arunoruto.github.io/carrel"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/arunoruto/carrel/releases/download/v0.6.0/carrel-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "ed21fbc1eca07b62a27f874ca9a7a391f2a50f9549e040077d3050bd38aea257"
  end
  on_linux do
    on_intel do
      url "https://github.com/arunoruto/carrel/releases/download/v0.6.0/carrel-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "718f2c3e67abdc682bdf1a4a476be781341300f0f65c8a1271f509bd5e714d20"
    end
    on_arm do
      url "https://github.com/arunoruto/carrel/releases/download/v0.6.0/carrel-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "868cccdcd1e078acf9b5f31d0df623702dd86744ce4a6c0dd8e6971fdf7de7d3"
    end
  end

  # Runs the text extractor (PyMuPDF), so papers get their text without further setup.
  depends_on "uv"

  def install
    bin.install "carrel"
  end

  def caveats
    <<~EOS
      Set it up (library folder, your group's server, Docling, Ollama, what runs in the background):
        carrel setup
      The full setup (search, Docling, recommendations): https://arunoruto.github.io/carrel/docs/setup/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/carrel --version")
  end
end
