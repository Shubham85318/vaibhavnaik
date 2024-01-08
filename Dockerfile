#base image node
FROM node:19-alpine

# set working directory
WORKDIR /api

# add `/app/node_modules/.bin` to $PATH
#ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./

#install git on OS
RUN apk --no-cache add git

RUN npm install --legacy-peer-deps

# add app
COPY . ./

# start app
CMD [ "npm", "run", "start"  ]

EXPOSE 3000