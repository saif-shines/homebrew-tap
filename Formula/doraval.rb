class Doraval < Formula
  desc "The context engineering toolkit for coding agents"
  homepage "https://github.com/saif-shines/doraval"
  version "0.6.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-arm64"
      sha256 "894d51fb889a538d4216bced4a45dca540936994c582edd031a79f4a5ea72100"
    else
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-x64"
      sha256 "902d8835960da4eae27e8eca59c7752969eeee1cb8e9771c236fdd19301ae2d4"
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
