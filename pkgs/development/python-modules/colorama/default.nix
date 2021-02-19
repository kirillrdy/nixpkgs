{ lib, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  pname = "colorama";
  version = "0.4.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "189n8hpijy14jfan4ha9f5n06mnl33cxz7ay92wjqgkr639s0vg9";
  };

  # No tests in archive
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/tartley/colorama";
    license = licenses.bsd3;
    description = "Cross-platform colored terminal text";
  };
}
