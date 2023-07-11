FROM python:3.6

RUN apt-get update && apt-get install -y \
    curl \
    apt-utils \
    git \
    locales \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt

# Install nodemon
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN npm install -g nodemon

# Set the locale
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

#Install python packages
RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install Cython pystan
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


COPY . /app
WORKDIR /app/src

ENV CHECKPOINTS_DIR /app/exports/checkpoints
