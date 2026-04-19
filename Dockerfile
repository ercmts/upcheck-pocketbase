FROM alpine:3.19

ARG PB_VERSION=0.23.4

RUN apk add --no-cache \
    unzip \
    ca-certificates \
    wget

# Download PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip

# Create data directory for persistence
RUN mkdir -p /pb/pb_data

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
