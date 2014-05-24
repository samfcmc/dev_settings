#!/bin/bash

JDK_ZIP_DIR="Here where downloaded jdk zip is"
JRE_ZIP_DIR="Here where downloaded jre zip is"
JDK_NAME=""
JRE_NAME=""
JDK_ZIP="$JDK_ZIP_DIR/$JDK_NAME.tgz"
JRE_ZIP="$JRE_ZIP_DIR/$JRE_NAME.tgz"
JAVA_DIR="/usr/local/java"
PROFILE_FILE="/etc/profile"
JAVA_BIN_DIR="/usr/bin/java"
JAVAC_BIN_DIR="/usr/bin/java"

echo "Preparing to install java"
echo "Creating JAVA directory"
sudo mkdir $JAVA_DIR

echo "Copying downloaded zips to $JAVA_DIR"
sudo cp -r $JDK_ZIP $JAVA_DIR
sudo cp -r $JRE_ZIP $JAVA_DIR

echo "Going to $JAVA_DIR"
cd $JAVA_DIR

sudo chmod a+x $JDK_ZIP
sudo chmod a+x $JRE_ZIP

echo "Extracting $JDK_ZIP"
sudo tar xvzf $JDK_ZIP
echo "Extracting $JRE_ZIP"
sudo tar xvzf $JRE_ZIP

echo "Configuring environment variables"
sudo echo "JAVA_HOME=$JAVA_DIR/JDK_NAME" >> $PROFILE_FILE
sudo echo "PATH=$JAVA_HOME/bin:$PATH" >> $PROFILE_FILE
sudo echo "JRE_HOME=$JAVA_DIR/$JRE_NAME" >> $PROFILE_FILE
sudo echo "PATH=$JRE_HOME/bin:$PATH" >> $PROFILE_FILE
sudo echo "export JAVA_HOME" >> $PROFILE_FILE
sudo echo "export JRE_HOME" >> $PROFILE_FILE
sudo echo "export PATH" >> $PROFILE_FILE

echo "Notifying system that JRE is available"
sudo update-alternatives --install "$JAVA_BIN_DIR" "java" "$JAVA_DIR/$JRE_NAME/bin/java" 1
echo "Notifying system that JDK is available"
sudo update-alternatives --install "$JAVAC_BIN_DIR" "javac" "$JAVA_DIR/$JDK_NAME/bin/javac" 1

echo "Setting this JRE to be the default one"
sudo update-alternatives --set java $JAVA_DIR/$JRE_NAME/bin/java
echo "Setting this JDK to be the default one"
sudo update-alternatives --set javac $JAVA_DIR/$JDK_NAME/bin/javac
