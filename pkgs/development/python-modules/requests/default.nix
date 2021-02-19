{ lib, fetchPypi, buildPythonPackage
, urllib3, idna, chardet, certifi
, pytest }:

buildPythonPackage rec {
  pname = "requests";
  version = "2.24.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "06r3017hz0hzxv42gpg73l8xvdjbzw7q904ljvp36b5p3l9rlmdk";
  };

  nativeBuildInputs = [ pytest ];
  propagatedBuildInputs = [ urllib3 idna chardet certifi ];
  # sadly, tests require networking
  doCheck = false;

  meta = with lib; {
    description = "An Apache2 licensed HTTP library, written in Python, for human beings";
    homepage = "http://docs.python-requests.org/en/latest/";
    license = licenses.asl20;
  };
}
