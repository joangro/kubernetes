#Debian 9
FROM debian:buster-slim 

RUN apt-get update && apt-get install -y stress

ENTRYPOINT ["stress"]

CMD ["--cpu", "1", "--timeout", "600s"]
