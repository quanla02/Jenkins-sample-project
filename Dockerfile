FROM node:14

RUN apt-get update && apt-get install -y libaio1 wget unzip


WORKDIR /app

COPY ["package.json", "yarn.lock", "./"]
RUN yarn install --network-timeout 1000000

COPY . .

RUN npm run build

CMD [ "npm", "run", "start" ]