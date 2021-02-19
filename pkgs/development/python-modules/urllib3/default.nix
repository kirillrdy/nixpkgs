{ lib, buildPythonPackage, fetchPypi
, pytest, mock, tornado, pyopenssl, cryptography
, idna, certifi, ipaddress, pysocks }:

buildPythonPackage rec {
  pname = "urllib3";
  version = "1.25.11";

  src = fetchPypi {
    inherit pname version;
    sha256 = "18hpzh1am1dqx81fypn57r2wk565fi4g14292qrc5jm1h9dalzld";
  };

  NOSE_EXCLUDE = lib.concatStringsSep "," [
    "test_headers" "test_headerdict" "test_can_validate_ip_san" "test_delayed_body_read_timeout"
    "test_timeout_errors_cause_retries" "test_select_multiple_interrupts_with_event"
  ];

  checkPhase = ''
    nosetests -v --cover-min-percentage 1
  '';

  doCheck = false;

  checkInputs = [ pytest mock tornado ];
  propagatedBuildInputs = [ pyopenssl cryptography idna certifi ipaddress pysocks ];

  meta = with lib; {
    description = "Powerful, sanity-friendly HTTP client for Python";
    homepage = "https://github.com/shazow/urllib3";
    license = licenses.mit;
  };
}
