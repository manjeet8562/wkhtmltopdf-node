# docker-wkhtmltopdf-node-alpine
This repository is explaining how wkhtmltopdf can be implemented in docker container based deployment with Node image for Features like HTML to PDF Generation

# Dockerfile
```
# Use an official Node.js image as a parent image
FROM node:18-bullseye

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Install wkhtmltopdf and its dependencies
RUN apt-get update && apt-get install -y \
    wkhtmltopdf \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the rest of your application code
COPY . .

# Expose any ports your app uses
EXPOSE 3000

# Command to run your app
CMD ["npm", "start"]

```
#### Set Library path on index.js for Windows and Ubuntu if needed
> Note: `wkhtmltopdf.command = '/usr/bin/wkhtmltopdf'` is required for referencing to wkhtmltopdf, In ubuntu you generally don't need that but for windows you have to specify it before using.


### Commands 

Follow these below commands to test it on local for the HTML to PDF Generation


#### Without docker image

```sh
cd wkhtmltopdf-node
npm i
npm run start
```

#### With docker image

```sh
docker build -t wkhtmlhtml-to-pdf .
```
```sh
docker run -it -p 3000:3000 wkhtmlhtml-to-pdf
```
#### Test with endpoint for the PDF Generation

> http://localhost:3000/generate-pdf

---

> Note: For Alpine image refer to [wkhtmltopdf-node-alpine](https://github.com/manjeet8562/wkhtmltopdf-node)

## License
MIT License

Copyright (c) 2024 Manjeet

## Author
**Manjeet**  
- [GitHub](https://github.com/manjeet8562) 
- [LinkedIn](https://www.linkedin.com/in/manjeet-sharma-46083a122)