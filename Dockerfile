FROM rocker/r-ver:4.2.2

RUN apt update 

RUN apt install bash-completion -y --no-install-recommends

RUN apt install gdebi -y --no-install-recommends
RUN apt install -y --no-install-recommends \
	ca-certificates \
	lsb-release \
	file \
	git \
	libapparmor1 \
	libclang-dev \
	libcurl4-openssl-dev \
	libedit2 \
	libobjc4 \
	libssl-dev \
	libpq5 \
	psmisc \
	procps \
	python-setuptools \
	pwgen \
	sudo \
	wget 
 
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2023.03.0-386-amd64.deb

# http://security.ubuntu.com/ubuntu/pool/main/o/openssl/
RUN wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.21_amd64.deb && \
	dpkg -i  libssl1.1_1.1.1-1ubuntu2.1~18.04.21_amd64.deb
RUN wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl-dev_1.1.1-1ubuntu2.1~18.04.21_amd64.deb && \
	dpkg -i libssl-dev_1.1.1-1ubuntu2.1~18.04.21_amd64.deb

RUN dpkg -i rstudio-server-2023.03.0-386-amd64.deb

EXPOSE 80

CMD ["bash"]
