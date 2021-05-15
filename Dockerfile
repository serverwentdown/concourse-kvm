ARG base=concourse/concourse:latest
FROM ${base}

RUN apt-get update \
	&& apt-get install -y \
		jq \
	&& mv /usr/local/concourse/bin/runc /usr/local/concourse/bin/runc-original

ENV RUNC=/usr/local/concourse/bin/runc-original
COPY runc-wrapper /usr/local/concourse/bin/runc
