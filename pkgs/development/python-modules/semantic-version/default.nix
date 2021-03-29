{ lib, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  pname = "semantic_version";
  version = "2.8.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0m4avx8zdkzc7qglv5zlr54g8yna5vl098drg5396ql7aph2vjyj";
  };

  # ModuleNotFoundError: No module named 'tests'
  doCheck = false;

  meta = with lib; {
    description = "A library implementing the 'SemVer' scheme";
    license = licenses.bsdOriginal;
    maintainers = with maintainers; [ layus makefu ];
  };
}
