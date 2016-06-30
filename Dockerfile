FROM alpine
MAINTAINER fermayo@gmail.com

RUN apk --update add curl jq
ADD run.sh /run.sh
CMD ["/run.sh"]
