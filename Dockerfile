FROM alpine/git
COPY . /data
WORKDIR /data
RUN rm -rf themes/*
RUN git clone https://github.com/google/docsy.git themes/docsy
RUN cd themes/docsy && git submodule update --init --recursive

FROM phaus/hugo:0.63.2
COPY --from=0 /data /data 
WORKDIR /data
RUN apk --update add nodejs npm \
    && npm install -D --save autoprefixer \
    && npm install -D --save postcss-cli \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/cache/apk/*
RUN rm -rf /data/public/* \
    && /usr/local/hugo

FROM nginx:alpine
LABEL maintainer="admin@go-rr.de"
COPY --from=1 /data/public /usr/share/nginx/html
