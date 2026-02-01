FROM ubuntu:22.04
LABEL maintainer="decloudlab@gmail.com"
LABEL description="x-ui dockerized server"
COPY ./run.sh /
RUN sed -i 's/\r//' /run.sh && chmod +x /run.sh
RUN apt-get update && apt-get install -y wget tar tzdata dpkg -y
RUN TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN wget https://github.com/MHSanaei/3x-ui/releases/download/v2.8.9/x-ui-linux-amd64.tar.gz
RUN tar -xzvf x-ui-linux-amd64.tar.gz
RUN rm -r x-ui-linux-amd64.tar.gz
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /x-ui
CMD ["/run.sh"]
