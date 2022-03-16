FROM node:12

RUN apt-get update && apt-get install -y libaio1 wget unzip


WORKDIR /app

COPY ["package.json", "yarn.lock", "./"]
RUN yarn

COPY . .

RUN npm run build

CMD [ "npm", "run", "start" ]