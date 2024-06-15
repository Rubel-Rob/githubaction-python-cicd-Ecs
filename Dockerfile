# Dockerfile

# inherit from this "empty base image", see https://hub.docker.com/_/python/
FROM python:3.10-alpine


# directory to install the app inside the container
WORKDIR /usr/src/app

# install python dependencies, this will be cached if the requirements.txt file does not change
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# copy application source code into container
COPY main.py .



# run this command at run-time
CMD [ "python", "main.py" ]

# expose this TCP-port
EXPOSE 8080
