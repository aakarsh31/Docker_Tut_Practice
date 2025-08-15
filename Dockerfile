FROM python:3.13.6

WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8000
CMD python ./index.py
# This Dockerfile sets up a Python environment, copies the application code,

