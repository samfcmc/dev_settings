#!/bin/bash

JDK_ZIP_DIR="$HOME/Downloads"
JRE_ZIP_DIR="$HOME/Downloads"
JDK_NAME="jdk-8u5-linux-x64"
JRE_NAME="jre-8u5-linux-x64"
JDK_ZIP="$JDK_ZIP_DIR/$JDK_NAME.tar.gz"
JRE_ZIP="$JRE_ZIP_DIR/$JRE_NAME.tar.gz"
JAVA_DIR="/usr/local/java"
JDK_DIR_NAME="jdk1.8.0_05"
JRE_DIR_NAME="jre1.8.0_05"
PROFILE_FILE="/etc/profile"
JAVA_BIN_DIR="/usr/bin/java"
JAVAC_BIN_DIR="/usr/bin/javac"

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
echo "JAVA_HOME=$JAVA_DIR/$JDK_NAME" | sudo tee -a $PROFILE_FILE
echo "PATH=$JAVA_HOME/bin:$PATH" | sudo tee -a $PROFILE_FILE
echo "JRE_HOME=$JAVA_DIR/$JRE_NAME" | sudo tee -a $PROFILE_FILE
echo "PATH=$JRE_HOME/bin:$PATH" | sudo tee -a $PROFILE_FILE
echo "export JAVA_HOME" | sudo tee -a $PROFILE_FILE
echo "export JRE_HOME" | sudo tee -a $PROFILE_FILE
echo "export PATH" | sudo tee -a $PROFILE_FILE

echo "Notifying system that JRE is available"
sudo update-alternatives --install "$JAVA_BIN_DIR" "java" "$JAVA_DIR/$JRE_DIR_NAME/bin/java" 1
echo "Notifying system that JDK is available"
sudo update-alternatives --install "$JAVAC_BIN_DIR" "javac" "$JAVA_DIR/$JDK_DIR_NAME/bin/javac" 1

echo "Setting this JRE to be the default one"
sudo update-alternatives --set java $JAVA_DIR/$JRE_DIR_NAME/bin/java
echo "Setting this JDK to be the default one"
sudo update-alternatives --set javac $JAVA_DIR/$JDK_DIR_NAME/bin/javac
