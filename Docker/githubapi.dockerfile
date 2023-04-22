# # Use an official Python runtime as a parent image
FROM python:3.9 

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./githubapi /home/ubuntu/githubapi/
WORKDIR /home/ubuntu/githubapi/