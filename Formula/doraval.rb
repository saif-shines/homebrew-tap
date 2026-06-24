class Doraval < Formula
  desc "The context engineering toolkit for coding agents"
  homepage "https://github.com/saif-shines/doraval"
  version "0.2.74"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-arm64"
      sha256 "8a7fccdf484696ac62a0846690d0b46b51adaf4427b69a989b7683006cb11c08"
    else
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-x64"
      sha256 "3b55a57bc4b73b751378c97d4e13d8e48ac7080a817df40ed22588843384a8f7"
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
