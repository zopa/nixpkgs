{stdenv, fetchurl, openssl, libidn, glib, pkgconfig, zlib}:

stdenv.mkDerivation {
  name = "loudmouth-1.4.3";

  src = fetchurl {
    url = mirror://gnome/sources/loudmouth/1.4/loudmouth-1.4.3.tar.bz2;
    sha256 = "1qr9z73i33y49pbpq6zy7q537g0iyc8sm56rjf0ylwcv01fkzacm";
  };

  configureFlags = "--with-ssl=openssl";

  propagatedBuildInputs = [openssl libidn glib zlib];

  buildNativeInputs = [pkgconfig];

  patches = [ ./glib-2.32-ftbfs.patch ];
}
