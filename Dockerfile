FROM node:alpine

RUN npm install -g md-to-pdf

WORKDIR /work
ENTRYPOINT ["md-to-pdf"]
