FROM node:14.18.2 AS development

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .


FROM node:14.18.2 AS production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --production

COPY --from=development /usr/src/app/node_modules ./node_modules
COPY --from=development /usr/src/app/ ./


CMD ["node", "index.js"]