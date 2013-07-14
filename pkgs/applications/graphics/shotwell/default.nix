{ fetchurl, stdenv, m4, glibc, gtk3, libexif, libgphoto2, libsoup, libxml2, vala, sqlite, webkit, pkgconfig, bash }:

# for dependencies see http://www.yorba.org/projects/shotwell/install/

stdenv.mkDerivation rec {
  version = "0.14.1";
  name = "shotwell-${version}";

  src = fetchurl {
    url = "http://yorba.org/download/shotwell/stable/${name}.tar.xz";
    sha256 = "1vrg83422b6v2dq586b79di6i0zzpgniqrimwx4vcx1kw8rlhp04";
  };

  # TODO (missing): gee, gexiv2, gio-unix, gmodule, gstreamer 1.0 (base, pbutils), librest, gudev, libraw

  preConfigure = ''
    substituteInPlace chkver --replace "/bin/bash" "${bash}/bin/bash"
  '';

  buildInputs = [ m4 glibc gtk3 libexif libgphoto2 libsoup libxml2 vala sqlite webkit pkgconfig ];

  meta = with stdenv.lib; {
    description = "Popular photo organizer for the GNOME desktop";
    homepage = http://www.yorba.org/projects/shotwell/;
    license = licenses.lgpl;
    maintainers = with maintainers; [iElectric];
    platforms = platforms.linux;
  };
}

