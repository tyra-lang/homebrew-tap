class Tyra < Formula
  desc "Tyra programming language compiler"
  homepage "https://github.com/tyra-lang/tyra"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tyra-lang/tyra/releases/download/v0.11.0/tyra-v0.11.0-macos-arm64.tar.gz"
      sha256 "9ce8a5516fe0b681d16cd64a7ca9b75ca09c22417ea98d77f1f2d0cb48c7b71f"
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
