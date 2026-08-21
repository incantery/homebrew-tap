class Rook < Formula
  desc "Attention and session layer over tmux for many terminal-agent sessions"
  homepage "https://github.com/incantery/rook"
  url "https://github.com/incantery/rook/archive/refs/tags/v0.44.0.tar.gz"
  sha256 "88972538cf3490e2d9d9f898d213896b827aac67f559572f8274fa5122393d33"
  license "MIT"
  head "https://github.com/incantery/rook.git", branch: "main"

  depends_on "go" => :build
  depends_on "tmux"
  depends_on "zoxide"
  depends_on "fzf"

  def install
    system "go", "build", *std_go_args(output: bin/"rook"), "./cmd/rook"
  end

  test do
    # rook with no subcommand attaches to tmux; exercise the argument
    # parser instead, which needs no server or state.
    assert_match "unknown command", shell_output("#{bin}/rook not-a-command 2>&1", 1)
    # The attention reader is pure state I/O — empty is a clean exit.
    system bin/"rook", "attention"
  end
end
