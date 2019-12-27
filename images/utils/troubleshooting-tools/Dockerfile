FROM progrium/busybox

RUN mv /lib/libgcc_s.so.1 /lib/libgcc_s.so.1.old && opkg-install \
	bash \
	git \
	curl \
	bind-dig \
	vim \
	jq \
	python python-dev python-pip python \
	nmap \
	netcat \
	mtr

ENTRYPOINT ["/bin/bash"]
