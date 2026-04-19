FROM alpine:3.19

ARG PB_VERSION=0.23.4

RUN apk add --no-cache unzip ca-certificates

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip && mkdir -p /pb/pb_data

RUN printf '#!/bin/sh\n\
set -e\n\
/pb/pocketbase superuser upsert "${PB_ADMIN_EMAIL}" "${PB_ADMIN_PASSWORD}"\n\
exec /pb/pocketbase serve --http=0.0.0.0:8080\n' > /pb/start.sh && chmod +x /pb/start.sh

EXPOSE 8080

CMD ["/pb/start.sh"]
