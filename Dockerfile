# syntax=docker/dockerfile:1

FROM alpine:3.17 AS ncc-1701
# the username
ARG USERNAME naruto
# the user group
ARG GROUPNAME wheel
# Specifying the Time Zone
ARG TZ Asia/Tokyo
ENV HOME /home/$USERNAME

RUN apk -U --no-cache add sudo tzdata \
  && adduser -S "$USERNAME" -G "$GROUPNAME" -h "$HOME" --disabled-password \
  && echo "%$GROUPNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir -p $HOME \
  && chown -R "$USERNAME:$GROUPNAME" "$HOME"

USER $USERNAME
WORKDIR $HOME
