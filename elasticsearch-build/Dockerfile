

FROM elasticsearch:7.7.1

COPY files/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY files/jvm.options /usr/share/elasticsearch/config/jvm.options
RUN curl https://releases.floragunn.com/search-guard-7/7.7.1-42.0.0/search-guard-7-7.7.1-42.0.0.zip -o /tmp/search-guard-7-7.7.1-42.0.0.zip

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install -b file:///tmp/search-guard-7-7.7.1-42.0.0.zip

COPY files/docker-test-entrypoint.sh /usr/local/bin/docker-test-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-test-entrypoint.sh

RUN mkdir -p /usr/share/elasticsearch/config/certs/
RUN curl https://downloads.search-guard.com/resources/certificates/certificates.zip -o /usr/share/elasticsearch/config/certs/certificates.zip \
  && cd /usr/share/elasticsearch/config/certs/ \
  && unzip certificates.zip 


ENTRYPOINT ["/tini", "--", "/usr/local/bin/docker-test-entrypoint.sh"]
CMD ["eswrapper"]


