{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname   = "pathspec";
  version = "0.5.9";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0wx82q2zl88dag7wr673js6rzvrh17kzyaxsa8mk97yqjnwfm9al";
  };

  meta = {
    description = "Utility library for gitignore-style pattern matching of file paths";
    homepage = "https://github.com/cpburnz/python-path-specification";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ copumpkin ];
  };
}
