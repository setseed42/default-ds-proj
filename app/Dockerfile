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
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN npm install -g nodemon

# Install pyodbc requirements
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y \
    msodbcsql \
    unixodbc \
    unixodbc-dev \
    mssql-tools \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

# Set the locale
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

#Install python packages
RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install Cython pystan
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


COPY . /app
WORKDIR /app
CMD ["/bin/bash", "app/runPydemon.sh"]
