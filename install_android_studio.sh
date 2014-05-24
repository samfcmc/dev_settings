#!/bin/bash

STUDIO_TAR_FILE="android-studio-bundle-135.1078000-linux.tgz"
STUDIO_URL="http://dl.google.com/android/studio/install/0.5.2/STUDIO_TAR_FILE"
STUDIO_APP_ENTRY="android-studio.desktop"
ECLIPSE_APP="/usr/share/applications/$STUDIO_APP_ENTRY"

echo "Downloading Android Studio"
wget $STUDIO_URL

echo "Copying downloaded file to $DEV_SOFTWARE_HOME"
cp -r *.tar.gz $DEV_SOFTWARE_HOME

echo "Extracting..."
cd $DEV_SOFTWARE_HOME
tar xvzf $STUDIO_TAR_FILE

echo "Adding to PATH"
echo "$ANDROID_STUDIO_HOME=$DEV_SOFTWARE_HOME/android-studio" | sudo tee -a /etc/profile
echo "export PATH=\$ANDROID_STUDIO_HOME/bin:\$PATH" | sudo tee -a /etc/profile

echo "Adding entry in applications menu"
echo "[Desktop Entry]" | sudo tee -a $STUDIO_APP
echo "Name=Android Studio" | sudo tee -a $STUDIO_APP
echo "Type=Application" | sudo tee -a $STUDIO_APP
echo "Icon=$DEV_SOFTWARE_HOME/android-studio/bin/studio.ico" | sudo tee -a $STUDIO_APP
echo "Exec=sh $DEV_SOFTWARE_HOME/android-studio/bin/studio.sh" | sudo tee -a $STUDIO_APP
echo "Categories=Application;Development;IDE;JAVA;Android" | sudo tee -a $STUDIO_APP
echo "Comment=IDE for Android development" | sudo tee -a $STUDIO_APP

echo "Cleaning the mess"
rm $DEV_SOFTWARE_HOME/$STUDIO_TAR_FILE

echo "Eclipse is installed"
