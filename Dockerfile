FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libterm-readline-perl-perl libterm-readkey-perl libdbi-perl libdbd-pg-perl

ENV HOME=/app

WORKDIR /app
COPY pgtop /app/pgtop

# a `.pgtop` file must exist for the volume/mount option to replace it
COPY pgtoprc.sample /app/.pgtop

ENTRYPOINT ["perl", "/app/pgtop"]
