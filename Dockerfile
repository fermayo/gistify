FROM alpine
MAINTAINER fermayo@gmail.com

RUN apk --update add curl jq python
ADD run.sh /run.sh
CMD ["/run.sh"]
