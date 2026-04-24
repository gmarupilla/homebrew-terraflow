class Terraflow < Formula
  include Language::Python::Virtualenv

  desc "Reproducible geospatial agricultural modeling pipeline"
  homepage "https://github.com/gmarupilla/AgroTerraFlow"
  url "https://github.com/gmarupilla/AgroTerraFlow/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b9ac0269fa3bb316729e813da34797cd9fc6a022bee876430fe58e044518b7d3"
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
