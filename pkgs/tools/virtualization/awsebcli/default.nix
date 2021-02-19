{ pkgs, lib, python3, glibcLocales }:
let

  localPython = python3.override {
    packageOverrides = self: super: {
   #   cement = super.cement.overridePythonAttrs (oldAttrs: rec {
   #     version = "2.8.2";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "1li2whjzfhbpg6fjb6r1r92fb3967p1xv6hqs3j787865h2ysrc7";
   #     };
   #   });

   #   python-dateutil = super.python-dateutil.overridePythonAttrs (oldAttrs: rec {
   #     version = "2.8.1";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "0g42w7k5007iv9dam6gnja2ry8ydwirh99mgdll35s12pyfzxsvk";
   #     };
   #   });


   #   colorama = super.colorama.overridePythonAttrs (oldAttrs: rec {
   #     version = "0.3.7";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "0avqkn6362v7k2kg3afb35g4sfdvixjgy890clip4q174p9whhz0";
   #     };
   #   });

   #   pathspec = super.pathspec.overridePythonAttrs (oldAttrs: rec {
   #     name = "${oldAttrs.pname}-${version}";
   #     version = "0.5.5";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "72c495d1bbe76674219e307f6d1c6062f2e1b0b483a5e4886435127d0df3d0d3";
   #     };
   #   });

   #   urllib3 = super.urllib3.overridePythonAttrs (oldAttrs: rec {
   #     version = "1.25.11";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "18hpzh1am1dqx81fypn57r2wk565fi4g14292qrc5jm1h9dalzld";
   #     };
   #   });

   #   idna = super.idna.overridePythonAttrs (oldAttrs: rec {
   #     version = "2.5";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "1ara12a7k2zc69msa0arrvw00gn61a6i6by01xb3lkkc0h4cxd9w";
   #     };
   #   });

   #   botocore = super.botocore.overridePythonAttrs (oldAttrs: rec {
   #     version = "1.19.63";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "14hacn6ckbg8cqx4x6792av87kfnkhqfzr8k4l4giphqz5p4ysfk";
   #     };
   #   });

   #   future = super.future.overridePythonAttrs (oldAttrs: rec {
   #     version = "0.16.0";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "1nzy1k4m9966sikp0qka7lirh8sqrsyainyf8rk97db7nwdfv773";
   #     };
   #   });

   #   requests = super.requests.overridePythonAttrs (oldAttrs: rec {
   #     version = "2.24.0";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "06r3017hz0hzxv42gpg73l8xvdjbzw7q904ljvp36b5p3l9rlmdk";
   #     };
   #   });

   #   semantic-version = super.semantic-version.overridePythonAttrs (oldAttrs: rec {
   #     version = "2.5.0";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "0p5n3d6blgkncxdz00yxqav0cis87fisdkirjm0ljjh7rdfx7aiv";
   #     };
   #   });

   #   tabulate = super.tabulate.overridePythonAttrs (oldAttrs: rec {
   #     version = "0.7.5";
   #     src = oldAttrs.src.override {
   #       inherit version;
   #       sha256 = "03l1r7ddd1a0j2snv1yd0hlnghjad3fg1an1jr8936ksv75slwch";
   #     };
   #   });

    #  pytest = super.pytest.overridePythonAttrs (oldAttrs: rec {
    #    version = "6.2.2";
    #    src = oldAttrs.src.override {
    #      inherit version;
    #      sha256 = "1yfpcfzkd2apvn9019pjx2jl7dazncigvkfvlcpdg10bgngdy7lx";
    #    };
    #  });


    #  wcwidth = super.wcwidth.overridePythonAttrs (oldAttrs: rec {
    #    version = "0.1.9";
    #    src = oldAttrs.src.override {
    #      inherit version;
    #      sha256 = "1wf5ycjx8s066rdvr0fgz4xds9a8zhs91c4jzxvvymm1c8l8cwzf";
    #    };
    #  });
    };
  };
in with localPython.pkgs; buildPythonApplication rec {
  pname = "awsebcli";
  version = "3.19.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "01gln3xkx7g0pqkxl2zjl33va4fwnvfn8a222xh60wrdg5711kgh";
  };

  buildInputs = [
    glibcLocales
  ];

  LC_ALL = "en_US.UTF-8";

  checkInputs = [

  ];

  checkPhase = "";

  doCheck = false;

  propagatedBuildInputs = [
    # FIXME: Add optional docker dependency, which requires requests >= 2.14.2.
    # Otherwise, awsebcli will try to install it using pip when using some
    # commands (like "eb local run").
    blessed botocore cement colorama dockerpty docopt pyyaml
    pathspec
    pkgs.docker-compose
    requests future semantic-version setuptools tabulate termcolor websocket_client
  ];

  meta = with lib; {
    homepage = "https://aws.amazon.com/elasticbeanstalk/";
    description = "A command line interface for Elastic Beanstalk";
    maintainers = with maintainers; [ eqyiel ];
    license = licenses.asl20;
  };
}
