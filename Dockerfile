ARG BUILD_IMAGE="crystallang/crystal:1.7.2-alpine-build"

FROM ${BUILD_IMAGE} AS dev

WORKDIR /app

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN --mount=type=cache,target=/var/cache/apk     set -eux;     apk upgrade

# RUN crystal build --release --link-flags=-Wl,-z,relro,-z,now docker/dev/sentry/sentry_cli.cr -o /usr/local/bin/sentry

EXPOSE 3000

CMD tail -f /dev/null

FROM dev AS build

COPY . /app

RUN shards build --link-flags=-Wl,-z,relro,-z,now --progress --static

FROM alpine as deploy
COPY --from=build /app/bin/production_line_report /app/
# COPY --from=build /app/docker/deploy/wait-for /app/

# ENTRYPOINT ["/app/wait-for", "postgresql:5432", "--", "tail -f /dev/null"]
ENTRYPOINT ["tail -f /dev/null"]
