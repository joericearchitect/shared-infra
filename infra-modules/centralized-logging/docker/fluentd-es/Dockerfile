FROM fluent/fluentd:v0.14.11
MAINTAINER YOUR_NAME <...@...>
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

# cutomize following "gem install fluent-plugin-..." line as you wish

USER root
RUN gem install fluent-plugin-elasticsearch

ADD fluent.conf /fluentd/etc/

EXPOSE 24224

USER fluent
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT

