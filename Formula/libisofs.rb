class Libisofs < Formula
  desc "Library to pack up hard disk files and directories into a ISO 9660 disk image"
  homepage "http://libburnia-project.org"
  url "http://files.libburnia-project.org/releases/libisofs-1.4.6.tar.gz"
  version "0.8.3"
  sha256 "14ab0b384e988d651092ca184d5f18dba83a9cfa05ff5e581770d6baa879a50a"

  def install
    ENV.universal_binary if build.universal?

    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize
    system "make", "install"
  end
end

