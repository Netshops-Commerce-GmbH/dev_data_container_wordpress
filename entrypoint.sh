#!/bin/bash

# Prechecks
if [ -z "$WORDPRESS_RELEASE_URL" ] ; then
	echo "Variable WORDPRESS_RELEASE_URL is not set. Exiting." > /dev/stdout
	exit 1
fi

if [ -z "$EXTRACT_PATH" ] ; then
	echo "Variable EXTRACT_PATH is not set. Exiting." > /dev/stdout
	exit 1
fi

# Start workflow
echo "Cleaning up $EXTRACT_PATH..." > /dev/stdout
rm -rf $EXTRACT_PATH/*
echo "Done." > /dev/stdout

cd /tmp


if [ ! -f "shopware.zip" ] ; then
	echo "Downloading Wordpress release from $WORDPRESS_RELEASE_URL." > /dev/stdout
	wget -q $WORDPRESS_RELEASE_URL -O shopware.zip
fi

echo "Extracting Wordpress release to $EXTRACT_PATH." > /dev/stdout
unzip -qq -u shopware.zip -d $EXTRACT_PATH

echo "Setting correct chmods in $EXTRACT_PATH." > /dev/stdout
cd $EXTRACT_PATH
chmod 777 -R .

echo "Linking Wordpress logs to /dev/stdout" > /dev/stdout

echo "Done." > /dev/stdout