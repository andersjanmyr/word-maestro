#!/bin/bash

timestamp=`date "+%Y%m%d_%H%M%S"`
sed -i.bak "s/DATE.*/DATE $timestamp/" word-maestro.appcache
rm word-maestro.appcache.bak
git commit -am 'Updated appcache'
