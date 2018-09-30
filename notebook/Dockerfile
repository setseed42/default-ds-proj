FROM jupyter/tensorflow-notebook
RUN pip --no-cache-dir install --upgrade pip
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app
WORKDIR /app
CMD ["/bin/bash", "notebook/runNotebook.sh"]
