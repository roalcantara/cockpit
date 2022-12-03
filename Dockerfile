# syntax=docker/dockerfile:1

FROM alpine:3.17 AS ncc-1701
ARG USERNAME=dev
ARG GROUPNAME=wheel
ARG TZ=America/Sao_Paulo
ENV HOME=/home/$USERNAME

RUN apk -U --no-cache add sudo tzdata \
  && adduser -S "$USERNAME" -G "$GROUPNAME" -h "$HOME" --disabled-password \
  && echo "%$GROUPNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir -p $HOME \
  && chown -R "$USERNAME:$GROUPNAME" "$HOME"

USER $USERNAME
WORKDIR $HOME
