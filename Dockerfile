ARG BUILD_IMAGE="crystallang/crystal:1.7.2-alpine-build"

FROM ${BUILD_IMAGE} AS dev

WORKDIR /app

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN --mount=type=cache,target=/var/cache/apk \
    set -eux; \
    apk upgrade
# apk add --no-cache --update postgresql-dev

# 这三行使用 && 写在一起，可能会引起第二个 wget 命令全局代理失败？
RUN wget https://raw.githubusercontent.com/zw963/sentry/master/src/sentry.cr
RUN wget https://raw.githubusercontent.com/zw963/sentry/master/src/sentry_cli.cr && \
    crystal build --release sentry_cli.cr -o /usr/local/bin/sentry

RUN wget https://github.com/boxboat/fixuid/releases/download/v0.5.1/fixuid-0.5.1-linux-amd64.tar.gz && \
    tar xvf fixuid-0.5.1-linux-amd64.tar.gz -C /usr/local/bin && \
    addgroup -g 1000 docker && \
    adduser -u 1000 -G docker -h /home/docker -s /bin/sh -D docker

RUN USER=docker && \
    GROUP=docker && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

# Run wget https://github.com/eficode/wait-for/releases/download/v2.2.4/wait-for -o /usr/local/bin/wait-for && \
#     chmod +x /usr/local/bin/wait-for

EXPOSE 3000

USER docker:docker

CMD fixuid sentry -b 'shards build && touch tmp/.success || (touch tmp/.error; exit 1)' -r 'bin/app'

FROM dev AS build

COPY . /app

RUN shards build --link-flags=-Wl,-z,relro,-z,now --progress --release --static

FROM alpine as deploy
COPY --from=build /app/bin/app /app/
# COPY --from=dev /usr/local/bin/fixuid /app/
# COPY --from=dev /usr/local/bin//wait-for /app/

# ENTRYPOINT ["/app/wait-for", "postgresql:5432", "--", "/app/app"]
ENTRYPOINT ["/app/app"]
