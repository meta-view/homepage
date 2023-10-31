FROM alpine/git
COPY . /data
WORKDIR /data
RUN rm -rf themes/*
RUN git clone https://github.com/google/docsy.git themes/docsy
RUN cd themes/docsy && git submodule update --init --recursive

FROM phaus/hugo:latest
COPY --from=0 /data /data 
WORKDIR /data
RUN apk --update add nodejs npm git
#RUN npm i
RUN npm install --save-dev autoprefixer
RUN npm install --save-dev postcss-cli
RUN npm install -D postcss
RUN rm -rf /var/lib/apt/lists/*
RUN rm /var/cache/apk/*
RUN /usr/local/hugo --cleanDestinationDir

FROM nginx:alpine
LABEL maintainer="philipp@haussleiter.de"
COPY --from=1 /data/public /usr/share/nginx/html
