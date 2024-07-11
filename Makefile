all: AppImage

AppImage:
	create-appimage.sh

clean:
	rm -rf pipe-viewer-main* tmplibs