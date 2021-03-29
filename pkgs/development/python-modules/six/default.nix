{ lib
, buildPythonPackage
, fetchPypi
, pytest
}:

buildPythonPackage rec {
  pname = "six";
  version = "1.14.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "02lw67hprv57hyg3cfy02y3ixjk3nzwc0dx3c4ynlvkfwkfdnsr3";
  };

  checkInputs = [ pytest ];

  checkPhase = ''
    py.test test_six.py
  '';

  # To prevent infinite recursion with pytest
  doCheck = false;

  meta = {
    description = "A Python 2 and 3 compatibility library";
    homepage = "https://pypi.python.org/pypi/six/";
    license = lib.licenses.mit;
  };
}
