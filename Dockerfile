FROM 	alpine:latest
RUN 	apk add --no-cache 	python3 			\
				py3-yaml			\
				openssh				\
				curl				\
				sudo				\
				runit				\
				bash				
COPY 	container /container
RUN 	/container/build.sh
ENTRYPOINT ["/container/tools/run"]
EXPOSE 22
