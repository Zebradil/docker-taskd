FROM alpine:3.12

LABEL maintainer="German Lashevich <german.lashevich@gmail.com>"

ARG TASKDDATA=/var/taskd
ENV TASKDDATA "${TASKDDATA}"
ENV PKI "${TASKDDATA}/pki"
WORKDIR "${TASKDDATA}"
VOLUME "${TASKDDATA}"

RUN apk add --no-cache taskd taskd-pki \
 && mkdir -p "${PKI}" \
 && cp /usr/share/taskd/pki/generate* "${PKI}" \
 && cp /usr/share/taskd/pki/vars "${PKI}" \
 && taskd init > /dev/null 2>&1 \
 && chown -R taskd:taskd .

COPY entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]

EXPOSE 53589

USER taskd
CMD ["taskd", "server"]
