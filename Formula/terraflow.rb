class Terraflow < Formula
  include Language::Python::Virtualenv

  desc "Reproducible geospatial agricultural modeling pipeline"
  homepage "https://github.com/gmarupilla/AgroTerraFlow"
  url "https://github.com/gmarupilla/AgroTerraFlow/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "5b12e34ec0e7720c6ac4c2ce18eed16bc6abd2acaafe9f63bec50a26f7f9f247"
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
