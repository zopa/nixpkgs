{ stdenv, fetchurl, pkgconfig, glib, atk, pango, cairo, perl, xlibs
, gdk_pixbuf, xz
, xineramaSupport ? true
, cupsSupport ? true, cups ? null
}:

assert xineramaSupport -> xlibs.libXinerama != null;
assert cupsSupport -> cups != null;

stdenv.mkDerivation {
  name = "gtk+-3.4.3";

  src = fetchurl {
    url = mirror://gnome/sources/gtk+/3.4/gtk+-3.4.3.tar.xz;
    sha256 = "17vr2dbzl76k0jglarai8dz3j2gyznhxcvp1rmlh8ncn59210q44";
  };

  enableParallelBuilding = true;

  buildNativeInputs = [ perl pkgconfig ];

  propagatedBuildInputs =
    [ xlibs.xlibs glib atk pango gdk_pixbuf cairo
      xlibs.libXrandr xlibs.libXrender xlibs.libXcomposite xlibs.libXi
    ]
    ++ stdenv.lib.optional xineramaSupport xlibs.libXinerama
    ++ stdenv.lib.optionals cupsSupport [ cups ];

  meta = {
    description = "A multi-platform toolkit for creating graphical user interfaces";

    longDescription = ''
      GTK+ is a highly usable, feature rich toolkit for creating
      graphical user interfaces which boasts cross platform
      compatibility and an easy to use API.  GTK+ it is written in C,
      but has bindings to many other popular programming languages
      such as C++, Python and C# among others.  GTK+ is licensed
      under the GNU LGPL 2.1 allowing development of both free and
      proprietary software with GTK+ without any license fees or
      royalties.
    '';

    homepage = http://www.gtk.org/;

    license = "LGPLv2+";

    maintainers = with stdenv.lib.maintainers; [urkud raskin];
    platforms = stdenv.lib.platforms.linux;
  };
}
