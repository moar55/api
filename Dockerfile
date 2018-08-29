# base image
FROM pelias/baseimage
RUN useradd -ms /bin/bash pelias
USER pelias

# maintainer information
LABEL maintainer="pelias.team@gmail.com"

# Where the app is built and run inside the docker fs
ENV WORK=/home/pelias
WORKDIR ${WORK}

# copy package.json first to prevent npm install being rerun when only code changes
COPY ./package.json ${WORK}
RUN npm install --production

COPY . ${WORK}

# start service
CMD [ "./bin/start" ]
