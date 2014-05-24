#!/bin/bash

ECLIPSE_TAR_FILE="eclipse-jee-kepler-SR2-linux-gtk-x86_64.tar.gz"
ECLIPSE_URL="http://eclipse.dcc.fc.up.pt/technology/epp/downloads/release/kepler/SR2/$ECLIPSE_TAR_FILE"
ECLIPSE_APP_ENTRY="eclipse.desktop"
ECLIPSE_APP="/usr/share/applications/$ECLIPSE_APP_ENTRY"

echo "Downloading Eclipse"
wget $ECLIPSE_URL

echo "Copying downloaded file to $DEV_SOFTWARE_HOME"
cp -r *.tar.gz $DEV_SOFTWARE_HOME

echo "Extracting..."
cd $DEV_SOFTWARE_HOME
tar xvzf $ECLIPSE_TAR_FILE

echo "Adding to PATH"
echo "ECLIPSE_HOME=$DEV_SOFTWARE_HOME/eclipse" | sudo tee -a /etc/profile
echo "export PATH=\$ECLIPSE_HOME:\$PATH" | sudo tee -a /etc/profile

echo "Adding entry in applications menu"
echo "[Desktop Entry]" | sudo tee -a $ECLIPSE_APP
echo "Name=Eclipse" | sudo tee -a $ECLIPSE_APP
echo "Type=Application" | sudo tee -a $ECLIPSE_APP
echo "Icon=$DEV_SOFTWARE_HOME/eclipse/icon.xpm" | sudo tee -a $ECLIPSE_APP
echo "Exec=$DEV_SOFTWARE_HOME/eclipse/eclipse" | sudo tee -a $ECLIPSE_APP
echo "Categories=Application;Development;IDE;JAVA" | sudo tee -a $ECLIPSE_APP
echo "Comment=Eclipse: IDE for JAVA" | sudo tee -a $ECLIPSE_APP

echo "Cleaning the mess"
rm $DEV_SOFTWARE_HOME/$ECLIPSE_TAR_FILE

echo "Eclipse is installed"
