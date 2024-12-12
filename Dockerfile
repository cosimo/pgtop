#
# Dockerfile for pgtop
# ====================
#
# Build the docker container as:
#
#    docker build -t my_pgtop .
#
# You most probably will want to run pgtop pointing it to your database
# rather than localhost:5432, so make sure to build a pgtoprc file
# from the provided sample `pgtoprc.sample`. After you've done that,
# run the docker container with:
#
#    cp pgtoprc.sample pgtoprc
#
#    # Edit the pgtoprc file to add your database host, port, name, etc..
#    docker run --rm -it -v ./pgtoprc:/app/.pgtop my_pgtop
#

FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libterm-readline-perl-perl libterm-readkey-perl \
    libdbi-perl libdbd-pg-perl libjson-perl libwww-perl

ENV HOME=/app

WORKDIR /app
COPY pgtop /app/pgtop

# a `.pgtop` file must exist for the volume/mount option to replace it
COPY pgtoprc.sample /app/.pgtop

ENTRYPOINT ["perl", "/app/pgtop"]
