#!/bin/bash


function init_certs {
   sleep 30
   cd /usr/share/elasticsearch/plugins/search-guard-7/tools
   chmod +x sgadmin.sh
   echo "about to init demo configs"
   JAVA_HOME=/usr/share/elasticsearch/jdk ./sgadmin.sh -cd ../sgconfig/ -icl -nhnv -cacert /usr/share/elasticsearch/config/certs/root-ca.pem -cert /usr/share/elasticsearch/config/certs/kirk.pem -key /usr/share/elasticsearch/config/certs/kirk-key.pem 
}


init_certs &
exec /usr/local/bin/docker-entrypoint.sh $@
