FROM node:6
ENV NODE_ENV development
WORKDIR /usr/src/app
RUN apt-get -qq update &&\
    apt-get -qq -y install git python3-pip python-pip default-jre default-jdk > /dev/null &&\
    pip install virtualenv --upgrade --quiet &&\
    apt-get -qq update
RUN git clone https://github.com/camptocamp/ngeo.git
RUN npm install --silent > /dev/null
EXPOSE 3000
CMD make dist && make serve
