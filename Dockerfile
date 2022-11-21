FROM node:16-alpine as builder
# this phase is to install dependancies and build the application

WORKDIR '/app'
COPY 'package.json' '/.'
RUN npm install
COPY './' './'
RUN npm run build

FROM nginx
COPY --from=builder '/app/build' '/usr/share/nginx/html'
