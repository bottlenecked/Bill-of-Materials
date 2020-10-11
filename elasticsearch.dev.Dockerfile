# 7.7.0 is the latest version that skroutz has released their plugins for
FROM docker.elastic.co/elasticsearch/elasticsearch:7.7.0

# Install greek stemmer
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install gr.skroutz:elasticsearch-skroutz-greekstemmer:7.7.0.1

# Install greeklish analyzer
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install gr.skroutz:elasticsearch-analysis-greeklish:7.7.0.1