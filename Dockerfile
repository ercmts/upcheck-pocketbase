FROM alpine:3.19

ARG PB_VERSION=0.23.4

RUN apk add --no-cache unzip ca-certificates

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip && mkdir -p /pb/pb_data

EXPOSE 8080

ENTRYPOINT ["/bin/sh", "-c", "/pb/pocketbase serve --http=0.0.0.0:8080 --initial-admin-email=${PB_ADMIN_EMAIL} --initial-admin-password=${PB_ADMIN_PASSWORD}"]
