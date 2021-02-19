{ lib, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  pname = "semantic_version";
  version = "2.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0p5n3d6blgkncxdz00yxqav0cis87fisdkirjm0ljjh7rdfx7aiv";
  };

  # ModuleNotFoundError: No module named 'tests'
  doCheck = false;

  meta = with lib; {
    description = "A library implementing the 'SemVer' scheme";
    license = licenses.bsdOriginal;
    maintainers = with maintainers; [ layus makefu ];
  };
}
