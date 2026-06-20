class Doraval < Formula
  desc "The context engineering toolkit for coding agents"
  homepage "https://github.com/saif-shines/doraval"
  version "0.2.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-arm64"
      sha256 "0ae022f8d27a4d361acd2ce8145e9103c065f7a5133464b7476851b195762d22"
    else
      url "https://github.com/saif-shines/doraval/releases/download/v#{version}/doraval-darwin-x64"
      sha256 "61f99507a9b4d4d6fa42661303ef64f88786bcf2279fbf21f81df31b19bb9a46"
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
