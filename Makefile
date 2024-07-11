all: AppImage

AppImage:
	./create-appimage.sh

test:
	./GTK_Pipe_Viewer-x86_64.AppImage

clean:
	rm -rf pipe-viewer-main*
