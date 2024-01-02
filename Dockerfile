FROM node:alpine3.18

WORKDIR /usr/src/app

COPY ./nodeapp/package.json .

RUN npm install

COPY . .

WORKDIR /usr/src/app/nodeapp

EXPOSE 3333

CMD ["npm", "run", "devstart"]