class Doraval < Formula
  desc "The context engineering toolkit for coding agents"
  homepage "https://github.com/saif-shines/doraval"
  version "0.2.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-arm64"
      sha256 "e077279026333a9aa771fbb6e6cacdf1a6d303c9c90e3fd227ac5d3178237236"
    else
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-x64"
      sha256 "01b4da577b0ae3fe9ea589e246bb691729f71093988898c0a2a6592e85c186f4"
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
