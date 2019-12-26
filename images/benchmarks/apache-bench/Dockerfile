FROM ubuntu

COPY wrk /bin

ENTRYPOINT ["/bin/bash", "-c", "wrk"]

CMD ["-c100", "-t4", "-d20", "--timeout", "10s", "https://spanner-latency-test-262609.appspot.com/"]

