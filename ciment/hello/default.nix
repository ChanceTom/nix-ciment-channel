{ stdenv, fetchurl }:
let
	icc=/nix/store/3lf5gc31c8325x7j3gib95b24kfxr1vy-intel-compilers-2017/compilers_and_libraries_2017.4.196/linux/bin/intel64/icc
	icpc=/nix/store/3lf5gc31c8325x7j3gib95b24kfxr1vy-intel-compilers-2017/compilers_and_libraries_2017.4.196/linux/bin/intel64/icpc
	ifort=/nix/store/3lf5gc31c8325x7j3gib95b24kfxr1vy-intel-compilers-2017/compilers_and_libraries_2017.4.196/linux/bin/intel64/ifort
	intel-library=/nix/store/3lf5gc31c8325x7j3gib95b24kfxr1vy-intel-compilers-2017/

stdenv.mkDerivation rec {
  name = "hello-2.10";

  src = fetchurl {
    url = "mirror://gnu/hello/${name}.tar.gz";
    sha256 = "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i";
  };
	configureFlagsArray=["-I /usr/include/x86_64-linux-gnu/"];
	configureFlags=[
	"CC=${icc}"
	"CXX=${icpc}"
	];
  doCheck = true;

  meta = {
    description = "A program that produces a familiar, friendly greeting";
    longDescription = ''
      GNU Hello is a program that prints "Hello, world!" when you run it.
      It is fully customizable.
    '';
    homepage = http://www.gnu.org/software/hello/manual/;
    license = stdenv.lib.licenses.gpl3Plus;
    maintainers = [ stdenv.lib.maintainers.eelco ];
    platforms = stdenv.lib.platforms.all;
  };
}
