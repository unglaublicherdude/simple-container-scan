ARG IMAGE=jwilder/whoami:latest

FROM ${IMAGE} as origin
FROM ubuntu


RUN apt-get update \
    && apt-get install -y clamav curl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm /etc/logrotate.d/btmp /etc/logrotate.d/clamav-freshclam /etc/logrotate.d/wtmp \
    && rm /var/log/apt/term.log /var/log/clamav/freshclam.log

COPY freshclam.conf /etc/clamav/freshclam.conf

RUN freshclam

COPY scan.sh /scan.sh
RUN chmod +x /scan.sh
COPY --from=origin / /toscan

ENTRYPOINT [ "/bin/bash", "/scan.sh" ]