# PIPE-VIEWER-APPIMAGE

script to automate the process of create an appimage for https://github.com/trizen/pipe-viewer

# Dependencies:
- cpanm: Fetch Perl dependencies
- wget: Fetch pipe-viewer
- unzip: Unzip pipe-viewer
- sed: Apply patches to make AppImage work
- <a href="https://github.com/AppImage/appimagetool">appimagetool</a>: Generate AppImage (needs to be in the cloned repo folder)


# Usage
Simply use the ```create-appimage.sh```