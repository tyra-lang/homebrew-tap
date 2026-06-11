class Tyra < Formula
  desc "Tyra programming language compiler"
  homepage "https://github.com/tyra-lang/tyra"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tyra-lang/tyra/releases/download/v0.10.0/tyra-v0.10.0-macos-arm64.tar.gz"
      sha256 "d3c4d1110817c5bcd2ae984012d829b7c6977fcf20e882fef8916829a062d949"
    end
  end

  depends_on "bdw-gc"

  def install
    bin.install "tyra"
    (lib/"tyra").install "libtyra_runtime.a"
    (lib/"tyra").install "stdlib"
  end

  test do
    (testpath/"hello.ty").write <<~TYRA
      fn main() -> Unit
        print("hello from tyra")
      end
    TYRA
    assert_match "hello from tyra", shell_output("#{bin}/tyra run hello.ty")
  end
end
