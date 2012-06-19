{ stdenv, fetchurl, perl, intltool, gettext, libusb, glib, gtk, pkgconfig
, bluez, readline, libXpm, pcsclite, libical }:

stdenv.mkDerivation rec {
  name = "gnokii-0.6.31";

  src = fetchurl {
    url = "http://www.gnokii.org/download/gnokii/0.6.x/${name}.tar.bz2";
    sha256 = "0095n2nyjy1wn19vp4f96832qk71hh0dhp6a08s6m9n10lxhhnlg";
  };

  buildInputs =
    [ perl intltool gettext libusb glib gtk pkgconfig bluez readline libXpm
      pcsclite libical
    ];

  meta = {
    description = "Cellphone tool";
    homepage = http://www.gnokii.org;
    maintainers = with stdenv.lib.maintainers; [ raskin urkud ];
    platforms = stdenv.lib.platforms.linux;
  };
}
