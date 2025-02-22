FROM python:3.12-slim

WORKDIR /Desktop/etl

COPY "main.py", "requirements.txt", "metadata.txt" /Desktop/etl/
COPY file_arrival/ /Desktop/etl/file_arrival
COPY processed_files /Desktop/etl/processed_files


RUN pip install --no-cache-dir -r requirements.txt


CMD [ "python", "/Desktop/etl/main.py"]
