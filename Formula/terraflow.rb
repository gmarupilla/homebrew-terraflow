class Terraflow < Formula
  include Language::Python::Virtualenv

  desc "Reproducible geospatial agricultural modeling pipeline"
  homepage "https://github.com/gmarupilla/AgroTerraFlow"
  url "https://github.com/gmarupilla/AgroTerraFlow/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "21b527fdac6665ce0a34bf5150bd0a1be359e20dc07d58ede28758c10c3ce07c"
  license "MIT"
  head "https://github.com/gmarupilla/AgroTerraFlow.git", branch: "main"

  depends_on "gdal"
  depends_on "proj"
  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install buildpath
    bin.install_symlink Dir["#{libexec}/bin/terraflow"]
  end

  test do
    assert_match "Usage: terraflow", shell_output("#{bin}/terraflow --help")
  end
end
