{ stdenv, fetchurl, pkgconfig, glib, gupnp, python, pygobject }:
 
stdenv.mkDerivation rec {
  name = "gupnp-igd-0.2.0";

  src = fetchurl {
    url = mirror://gnome/sources/gupnp-igd/0.2/gupnp-igd-0.2.0.tar.xz;
    sha256 = "0llr80130i11pgg7wj1acfhlm7q66m953ngh549h53gi272ifk4j";
  };

  propagatedBuildInputs = [ gupnp ];

  buildInputs = [ glib python pygobject ];

  buildNativeInputs = [ pkgconfig ];

  meta = {
    homepage = http://www.gupnp.org/;
  };
}

