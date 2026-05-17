class Delta < Formula
  desc "Local Go CLI/TUI coding assistant"
  homepage "https://github.com/pepa-internal/delta"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://pub-d72007ffd8f445f7a29ed2d868a07438.r2.dev/delta/v#{version}/delta_v#{version}_darwin_amd64.tar.gz"
      sha256 "5c0878ff163b5b68d8f64df4a7f083ec2df042d2d8427337d6750b333d346a65"
    end

    on_arm do
      url "https://pub-d72007ffd8f445f7a29ed2d868a07438.r2.dev/delta/v#{version}/delta_v#{version}_darwin_arm64.tar.gz"
      sha256 "ad88e99b5b2cde1ad200f6f718a16b8c5cd19a7c2eb910536e85afdfe246b9e1"
    end
  end

  on_linux do
    on_intel do
      url "https://pub-d72007ffd8f445f7a29ed2d868a07438.r2.dev/delta/v#{version}/delta_v#{version}_linux_amd64.tar.gz"
      sha256 "4104cc0688134046dc3d01d6aa6b8bb5df74fe5b50b22734dffeee7b9c90a1df"
    end

    on_arm do
      url "https://pub-d72007ffd8f445f7a29ed2d868a07438.r2.dev/delta/v#{version}/delta_v#{version}_linux_arm64.tar.gz"
      sha256 "1049a6cc9d178e43d616a283219003900de37b6c75bb4cbe213fcc173319857d"
    end
  end

  depends_on "git"
  depends_on "ripgrep"

  def install
    bin.install "delta"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    assert_match "delta #{version}", shell_output("#{bin}/delta --version")
    assert_match "commands:", shell_output("#{bin}/delta help 2>&1")
  end
end
