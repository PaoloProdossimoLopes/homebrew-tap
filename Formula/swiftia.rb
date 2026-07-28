class Swiftia < Formula
  desc "Project automation CLI configured with configuration.yml"
  homepage "https://github.com/PaoloProdossimoLopes/homebrew-tap"
  url "https://github.com/PaoloProdossimoLopes/homebrew-tap/releases/download/v0.1.0/swiftia-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "f484e21253ddaa82253596ba2e94b1e7495c16615e3beb19ddba3577181c70bc"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "git"
  depends_on "gh"

  def install
    bin.install "swiftia"
  end

  test do
    (testpath/"configuration.yml").write <<~YAML
      version: 1
      project:
        name: homebrew-test
    YAML

    assert_match(
      'Configuration valid for project "homebrew-test".',
      shell_output("#{bin}/swiftia validate"),
    )
    assert_predicate testpath/".swiftia/log", :directory?
  end
end
