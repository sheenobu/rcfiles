{ stdenv, fetchurl, utillinux, nukeReferences
, configFile ? "all"

# Kernel dependencies
, kernel ? null, spl ? null
}:

with stdenv.lib;
let
  buildKernel = any (n: n == configFile) [ "kernel" "all" ];
  buildUser = any (n: n == configFile) [ "user" "all" ];
in

assert any (n: n == configFile) [ "kernel" "user" "all" ];
assert buildKernel -> kernel != null && spl != null;

stdenv.mkDerivation rec {
  name = "r8168-${configFile}-${version}${optionalString buildKernel "-${kernel.version}"}";

  version = "8.041.01";

  src = fetchurl {
    url = "http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0004-r8168-8.041.01.tar.bz2";
    sha256 = "0qpc72svjcnc7i812px4b8z1jd1xjal3q4v8xa3z60nr3l2d45vh";
  };

  # for zdb to get the rpath to libgcc_s, needed for pthread_cancel to work
  #NIX_CFLAGS_LINK = "-lgcc_s";

  preBuild = ''
    substituteInPlace src/Makefile \
      --replace "\$(shell uname -r)" "${kernel.modDirVersion}" \
      --replace "/lib/modules" "${kernel.dev}/lib/modules" \
  '';

  makeFlags = [ "clean" "modules" ];

  installPhase = ''
      mkdir -p "$out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/"
      install -v -D -m 644 src/r8168.ko "$out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/"
  '';

  enableParallelBuilding = true;

  postInstall = ''
    # Prevent kernel modules from depending on the Linux -dev output.
    nuke-refs $(find $out -name "*.ko")
  '' + optionalString buildUser ''

  '';

  meta = {
    description = "Realtek r8168 Linux Kernel module";
    longDescription = ''
      '';
    platforms = platforms.linux;
    maintainers = with maintainers; [ sheenobu ];
  };
}
