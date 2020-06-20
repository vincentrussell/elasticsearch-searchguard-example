 
#!/bin/bash


function init_certs {
   sleep 30
   cd /usr/share/elasticsearch/plugins/search-guard-7/tools
   chmod +x install_demo_configuration.sh
   chmod +x sgadmin.sh
   echo "about to init demo configs"
   #cat install_demo_configuration.sh
   #exec /usr/share/elasticsearch/plugins/search-guard-7/tools/install_demo_configuration.sh
   JAVA_HOME=/usr/share/elasticsearch/jdk ./sgadmin.sh -cd ../sgconfig/ -icl -nhnv -cacert /usr/share/elasticsearch/config/certs/root-ca.pem -cert /usr/share/elasticsearch/config/certs/kirk.pem -key /usr/share/elasticsearch/config/certs/kirk-key.pem 
}


cd /usr/share/elasticsearch/
bin/elasticsearch-plugin install -b file:///tmp/search-guard-7-7.7.1-42.0.0.zip

init_certs &
exec /usr/local/bin/docker-entrypoint.sh $@
