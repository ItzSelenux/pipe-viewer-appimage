#!/bin/bash

if [ -d "/usr/bin/cpanm" ]; then
	exit 0
else
	:
fi

wget https://github.com/trizen/pipe-viewer/archive/main.zip -O pipe-viewer-main.zip &&
unzip -n pipe-viewer-main.zip &&

cp -v AppRun pipe-viewer-main &&
cp -v gtk-pipe-viewer.png pipe-viewer-main &&
cp -v gtk-pipe-viewer.desktop pipe-viewer-main &&
cp -v left_arrow.png pipe-viewer-main/share/icons/ &&
cp -v right_arrow.png pipe-viewer-main/share/icons/ &&
cp -v list-remove-symbolic.svg pipe-viewer-main/share/icons/ &&

cpanm --local-lib=pipe-viewer-main Cairo::GObject Glib::Object::Introspection LWP::Protocol::https Data::Dump JSON Gtk3 File::ShareDir &&
cd pipe-viewer-main &&

mkdir -pv lib/perl5/WWW
cp -vr lib/WWW/* lib/perl5/WWW &&

sed -i 's/my \$glade_file = catfile(\$share_dir, "gtk-pipe-viewer.glade");/use FindBin;\nmy \$dir = \$FindBin::Bin;\nmy \$glade_file = catfile(\$dir,"..","share", "gtk-pipe-viewer.glade");/' "bin/gtk-pipe-viewer" &&
sed -i 's/my \$icons_path = catdir(\$share_dir, '\''icons'\'');/my \$icons_path = catdir(\$dir, "..","share", '\''icons'\'');/' "bin/gtk-pipe-viewer" &&
sed -i '/my $share_dir =/,/dist_dir/d' bin/gtk-pipe-viewer &&

chmod +x AppRun &&

cd ../ &&
ARCH=x86_64 ./appimagetool-x86_64.AppImage pipe-viewer-main/
