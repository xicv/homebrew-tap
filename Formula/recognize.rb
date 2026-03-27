class Recognize < Formula
  desc "Real-time speech recognition with CoreML acceleration for macOS"
  homepage "https://github.com/xicv/recognize"
  version "2.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/xicv/recognize/releases/download/v2.2.0/recognize-2.2.0-arm64.tar.gz"
    sha256 "78d3a013824a262c8a030ad633ed135e21407bba94431f3d9e3f2c174fa03524"
  end

  depends_on :macos

  def install
    bin.install "bin/recognize"
    lib.install Dir["lib/*.dylib"]
  end

  def post_install
    system "mkdir", "-p", "#{ENV["HOME"]}/.recognize/models", "#{ENV["HOME"]}/.recognize/tmp"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/recognize --help 2>&1", 0)
  end
end
