class Doraval < Formula
  desc "The context engineering toolkit for coding agents"
  homepage "https://github.com/saif-shines/doraval"
  version "0.2.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-arm64"
      sha256 "5005712007a1012ff49cdd28f86225cd5e2a78bf45f7ca4d936357711cbde8b3"
    else
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-x64"
      sha256 "99f7945c22f2b46c6af1e77b2b3c3f02959aa29b4446adc99975e15451e23330"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "doraval-darwin-arm64" => "doraval"
    else
      bin.install "doraval-darwin-x64" => "doraval"
    end
    bin.install_symlink "doraval" => "dora"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doraval --version")
  end
end
