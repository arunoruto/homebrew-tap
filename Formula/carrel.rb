# Written by carrel's release workflow (packaging/homebrew.sh); edits here are overwritten.
class Carrel < Formula
  desc "Research paper library for you and your AI"
  homepage "https://arunoruto.github.io/carrel"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/arunoruto/carrel/releases/download/v0.4.0/carrel-v0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "c06c295583d3d0be7ff55b374bb6d819e23b189d228082f90dbc43fbebbbb713"
  end
  on_linux do
    on_intel do
      url "https://github.com/arunoruto/carrel/releases/download/v0.4.0/carrel-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5db4d2288285603181feb07f027696875963ee4b962bd26fd84eca472282c600"
    end
    on_arm do
      url "https://github.com/arunoruto/carrel/releases/download/v0.4.0/carrel-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "284d8623e4108225a60d42c03e114cf5b80435cb35b40acae8e23dce9d0aad44"
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
