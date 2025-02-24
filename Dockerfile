FROM python:3.12-slim

WORKDIR /Desktop/etl/docker-bindmount

COPY main.py /Desktop/etl/docker-bindmount
COPY requirements.txt /Desktop/etl/docker-bindmount
COPY metadata.txt /Desktop/etl/docker-bindmount
COPY file_arrival/ /Desktop/etl/docker-bindmount/file_arrival
COPY processed_files/ /Desktop/etl/docker-bindmount/processed_files


ARG ARG_PATH
ARG ARG_metadatatxt
ARG ARG_proccessed
ARG ARG_counter

ENV path=${ARG_PATH}
ENV metadatatxt=${ARG_metadatatxt}
ENV proccessed=${ARG_proccessed}
ENV counter=${ARG_counter}


RUN pip install --no-cache-dir -r requirements.txt


CMD [ "python", "/Desktop/etl/main.py"]

