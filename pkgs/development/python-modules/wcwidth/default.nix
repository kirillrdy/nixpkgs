{ lib, fetchPypi, buildPythonPackage, pytestCheckHook
, isPy3k
, backports_functools_lru_cache
, setuptools
}:

buildPythonPackage rec {
  pname = "wcwidth";
  version = "0.1.9";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1wf5ycjx8s066rdvr0fgz4xds9a8zhs91c4jzxvvymm1c8l8cwzf";
  };

  checkInputs = [ pytestCheckHook ];

  propagatedBuildInputs = [ setuptools ] ++ lib.optionals (!isPy3k) [
    backports_functools_lru_cache
  ];

  # To prevent infinite recursion with pytest
  doCheck = false;

  meta = with lib; {
    description = "Measures number of Terminal column cells of wide-character codes";
    longDescription = ''
      This API is mainly for Terminal Emulator implementors -- any Python
      program that attempts to determine the printable width of a string on
      a Terminal. It is implemented in python (no C library calls) and has
      no 3rd-party dependencies.
    '';
    homepage = "https://github.com/jquast/wcwidth";
    license = licenses.mit;
  };
}
