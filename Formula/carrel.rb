# Written by carrel's release workflow (packaging/homebrew.sh); edits here are overwritten.
class Carrel < Formula
  desc "Research paper library for you and your AI"
  homepage "https://arunoruto.github.io/carrel"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/arunoruto/carrel/releases/download/v0.7.0/carrel-v0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "203a0aa6ef818b958283c7abc33cd9745c0e9a2f81480eab04ebb5d5d6752c99"
  end
  on_linux do
    on_intel do
      url "https://github.com/arunoruto/carrel/releases/download/v0.7.0/carrel-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec3b9f642d880ec26daefbec37e821b678a6a8d24e7cc9d910600aa8f01ced9f"
    end
    on_arm do
      url "https://github.com/arunoruto/carrel/releases/download/v0.7.0/carrel-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "af65d2ece456e90856d41e0aa742a6b97e43d44e6cf5a582f094c51940228326"
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
