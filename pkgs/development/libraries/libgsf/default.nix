{ fetchurl, stdenv, perl, perlXMLParser, pkgconfig, libxml2
, glib, gettext, intltool, bzip2, gdk_pixbuf
, gnome_vfs, libbonobo, python }:


stdenv.mkDerivation rec {
  name = "libgsf-1.14.23";

  src = fetchurl {
    url = mirror://gnome/sources/libgsf/1.14/libgsf-1.14.23.tar.xz;
    sha256 = "05zvaazf0d584nfirwsz7889lbsl4v781hslv3kda6akiwbwdhdz";
  };

  buildNativeInputs = [ intltool pkgconfig ];
  buildInputs =
    [ perl perlXMLParser gettext bzip2 gnome_vfs python gdk_pixbuf ];

  propagatedBuildInputs = [ glib libxml2 libbonobo ];

  patches = [ ( fetchurl {
    url = "http://git.gnome.org/browse/libgsf/patch/?id=7a4a9d62e0efa8510a9c8aa957233327d11f355b";
    name = "gsf-rename-clone.patch";
    sha256 = "0dvgw3j1gny13b8928wsvkp3wz3wihlwx2xaf05rircmrj6pjqzm";
  } ) ];

  doCheck = true;

  meta = {
    homepage = http://www.gnome.org/projects/libgsf;
    license = "LGPLv2";
    description = "GNOME's Structured File Library";

    longDescription = ''
      Libgsf aims to provide an efficient extensible I/O abstraction for
      dealing with different structured file formats.
    '';

    maintainers = [ stdenv.lib.maintainers.ludo ];
    platforms = stdenv.lib.platforms.linux;
  };
}
