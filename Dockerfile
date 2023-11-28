FROM node:6
WORKDIR /app
COPY . /app
EXPOSE 8000
CMD ["node","app.js"]
