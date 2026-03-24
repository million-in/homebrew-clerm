class Clerm < Formula
    desc "Schema-driven CLERM CLI and resolver"
    homepage "https://github.com/million-in/clerm"
    url "https://github.com/million-in/clerm/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "870783a24f3ae6c883c52b9c16ecc15cf4e92f8f817de5e19cf99798aa0d130f"
    license "MIT"

    depends_on "go" => :build

    def install
      system "go", "build", *std_go_args(output: bin/"clerm"), "./cmd/clerm"
      system "go", "build", *std_go_args(output: bin/"clerm-resolver"), "./cmd/clerm-resolver"
    end

    test do
      assert_match "clerm", shell_output("#{bin}/clerm help")
      assert_match "schema", shell_output("#{bin}/clerm-resolver -h 2>&1")
    end
  end
