######
#
# Author: Shea Levy
# Authoremail: sheaATshealevyDOTcom
# Start time: April, 2015
#
# Author: Brandon Barker
# Authoremail: first dot last at gmail . com
# Start time: October, 2018
#
######

{ stdenv
, ats2
, boehmgc
, gmp
, autoconf
, automake
, version
}:

stdenv.mkDerivation rec {
  name = "ATS3-Xanadu-${version}.tgz";

  buildInputs = [ autoconf automake boehmgc gmp ];

  src = builtins.filterSource (path: type:
    (toString path) != (toString ../.git)
  ) ../.;

  PATSHOME = "${ats2}/lib/ats2-postiats-${ats2.version}";
  PATSHOMERELOC = "${PATSHOME}";
  
  # configurePhase = ''
  #  patchShebangs doc/DISTRIB/ATS-Postiats/autogen.sh
  #  export XATSHOME=$PWD
  #  make -f codegen/Makefile_atslib
  # '';
 
  # buildPhase = ''
  #   make -f srcgen/Makefile_stat
  # '';

  # installPhase = ''
  #   mv doc/DISTRIB/${name} $out
  # '';

  shellHook = ''
    export XATSHOME=$PWD
    source ./nix/path_hack.sh
    export LD_LIBRARY_PATH=LD_LIBRARY_PATH:"${boehmgc}/lib"
  '';
}

