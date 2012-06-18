{ stdenv, fetchurl, pkgconfig, gettext, x11, glib, cairo, libpng }:

stdenv.mkDerivation rec {
  name = "pango-1.30.1";

  src = fetchurl {
    url = mirror://gnome/sources/pango/1.30/pango-1.30.1.tar.xz;
    sha256 = "1ghc49b5ahv2is7hlq6is5jbpkvhx5kkays6spf2s9rw2hg0d31s";
  };

  buildInputs = stdenv.lib.optional stdenv.isDarwin gettext;

  buildNativeInputs = [ pkgconfig ];

  propagatedBuildInputs = [ x11 glib cairo libpng ];

  meta = {
    description = "A library for laying out and rendering of text, with an emphasis on internationalization";

    longDescription = ''
      Pango is a library for laying out and rendering of text, with an
      emphasis on internationalization.  Pango can be used anywhere
      that text layout is needed, though most of the work on Pango so
      far has been done in the context of the GTK+ widget toolkit.
      Pango forms the core of text and font handling for GTK+-2.x.
    '';

    homepage = http://www.pango.org/;
    license = "LGPLv2+";

    maintainers = with stdenv.lib.maintainers; [ raskin urkud ];
    platforms = stdenv.lib.platforms.linux;
  };
}
