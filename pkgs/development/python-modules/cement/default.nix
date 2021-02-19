{ lib, buildPythonPackage, fetchPypi, isPy3k }:

buildPythonPackage rec {
  pname = "cement";
  version = "2.8.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1li2whjzfhbpg6fjb6r1r92fb3967p1xv6hqs3j787865h2ysrc7";
  };

  # Disable test tests since they depend on a memcached server running on
  # 127.0.0.1:11211.
  doCheck = false;

  disabled = !isPy3k;

  meta = with lib; {
    homepage = "https://builtoncement.com/";
    description = "A CLI Application Framework for Python.";
    maintainers = with maintainers; [ eqyiel ];
    license = licenses.bsd3;
  };
}
