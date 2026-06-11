class Tyra < Formula
  desc "Tyra programming language compiler"
  homepage "https://github.com/tyra-lang/tyra"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tyra-lang/tyra/releases/download/v0.10.1/tyra-v0.10.1-macos-arm64.tar.gz"
      sha256 "489d5dfe79d408fdb74ec6259730abc22131c7d7acec5a5947a01f70d604b915"
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
