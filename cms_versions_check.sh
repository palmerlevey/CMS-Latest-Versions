#!/bin/sh
##
## Live CMS Versions Check
version='2.0a';

## Place all CMS version lookup commands in ./cmsvlcmds.d/
## See ./cmsvlcmds.d/cms_template.sh for command templating.

# Versioning file status.
versionsfile="cms_latest";
versionstmpfile="$versionsfile.tmp";
runlog="run.log";

if [ -f $versionstmpfile ]; then rm -f $versionstmpfile; fi
if [ -f $versionsfile ]; then touch $versionstmpfile; writefile=$versionstmpfile; else writefile=$versionsfile; fi

## Run all lookup commands from the ./cmsvlcmds.d/ folder by category.

# Billing 
echo "BILLING" >> $writefile;
echo "" >> $writefile;
	for cmsvlcmd in ./cmsvlcmds.d/billing/*.sh; do
		if [ -r "$cmsvlcmd" ]; then
			# Uncomment for debugging.
			# echo "Running $(grep cmsname= $cmsvlcmd |sed 's/cmsname=//g' |sed "s/'//g" |sed 's/;//g') lookup now...";
			/bin/sh $cmsvlcmd >> $writefile;
		fi
	done	
echo "" >> $writefile;

# Blogs
echo "BLOGS" >> $writefile;
echo "" >> $writefile;
	for cmsvlcmd in ./cmsvlcmds.d/blogs/*.sh; do
		if [ -r "$cmsvlcmd" ]; then
			# Uncomment for debugging.
			# echo "Running $(grep cmsname= $cmsvlcmd |sed 's/cmsname=//g' |sed "s/'//g" |sed 's/;//g') lookup now...";
			/bin/sh $cmsvlcmd >> $writefile;
		fi
	done	
echo "" >> $writefile;

# Ecommerce
echo "ECOMMERCE" >> $writefile;
echo "" >> $writefile;
	for cmsvlcmd in ./cmsvlcmds.d/ecommerce/*.sh; do
		if [ -r "$cmsvlcmd" ]; then
			# Uncomment for debugging.
			# echo "Running $(grep cmsname= $cmsvlcmd |sed 's/cmsname=//g' |sed "s/'//g" |sed 's/;//g') lookup now...";
			/bin/sh $cmsvlcmd >> $writefile;
		fi
	done	
echo "" >> $writefile;

# Forums
echo "FORUMS" >> $writefile;
echo "" >> $writefile;
	for cmsvlcmd in ./cmsvlcmds.d/forums/*.sh; do
		if [ -r "$cmsvlcmd" ]; then
			# Uncomment for debugging.
			# echo "Running $(grep cmsname= $cmsvlcmd |sed 's/cmsname=//g' |sed "s/'//g" |sed 's/;//g') lookup now...";
			/bin/sh $cmsvlcmd >> $writefile;
		fi
	done	
echo "" >> $writefile;

# Social
echo "SOCIAL" >> $writefile;
echo "" >> $writefile;
	for cmsvlcmd in ./cmsvlcmds.d/social/*.sh; do
		if [ -r "$cmsvlcmd" ]; then
			# Uncomment for debugging.
			# echo "Running $(grep cmsname= $cmsvlcmd |sed 's/cmsname=//g' |sed "s/'//g" |sed 's/;//g') lookup now...";
			/bin/sh $cmsvlcmd >> $writefile;
		fi
	done	
echo "" >> $writefile;

# Update Time Stamp
echo "" >> $writefile;
echo "Last updated $(date)" >> $writefile;

if [ $writefile=$versionstmpfile ]; then mv -f $versionstmpfile $versionsfile; fi

# Temp cron debugging.
echo "Ran version $version @ $(date)" >> $runlog
