#!/bin/sh
# CMS Name
cmsname='ImpressCMS';

# CMS Info/Description
cmshomepage='http://impresscms.org';
cmslatestvurl='http://impresscms.org/';
cmsdescrip='NA';
cmsfindinstalledvi='NA';

# Additional curl arguments required.
curlargs='\
-A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5" \
-s ';

# Run version lookup command.
cmslatestversion=$(curl $curlargs $cmslatestvurl |grep -Po "version (\d{1})\.(\d{1,2})\.(\d{1,2})" |sed 's/version //g');

# Run and print the latest version lookup.
echo "$cmsname: $cmslatestversion";