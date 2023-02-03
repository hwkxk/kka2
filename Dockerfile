FROM node:lts-buster

WORKDIR /app
COPY package.json .
COPY setup.sh .
RUN bash setup.sh
COPY yarn.lock .
RUN yarn
COPY . .
ENV PORT=80
EXPOSE 80
CMD ["bash", "start.sh"]
