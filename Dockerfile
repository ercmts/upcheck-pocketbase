FROM alpine:3.19

ARG PB_VERSION=0.23.4

RUN apk add --no-cache \
    unzip \
    ca-certificates \
    wget

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip

RUN mkdir -p /pb/pb_data

COPY entrypoint.sh /pb/entrypoint.sh
RUN chmod +x /pb/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/pb/entrypoint.sh"]
