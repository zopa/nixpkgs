{ stdenv, fetchurl, pkgconfig, glib, libtiff, libjpeg, libpng, libX11, xz
, jasper, shared_mime_info }:

stdenv.mkDerivation {
  name = "gdk-pixbuf-2.26.1";

  src = fetchurl {
    url = mirror://gnome/sources/gdk-pixbuf/2.26/gdk-pixbuf-2.26.1.tar.xz;
    sha256 = "1fn79r5vk1ck6xd5f7dgckbfhf2xrqq6f3389jx1bk6rb0mz22m6";
  };

  # !!! We might want to factor out the gdk-pixbuf-xlib subpackage.
  buildInputs = [ libX11 ];

  buildNativeInputs = [ pkgconfig shared_mime_info ];

  propagatedBuildInputs = [ glib libtiff libjpeg libpng jasper ];

  configureFlags = "--with-libjasper --with-x11";

  meta = {
    description = "A library for image loading and manipulation";

    homepage = http://library.gnome.org/devel/gdk-pixbuf/;

    maintainers = with stdenv.lib.maintainers; [ eelco urkud ];
    platforms = stdenv.lib.platforms.linux;
  };
}
