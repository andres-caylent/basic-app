FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html

#FROM python:3.7-slim
#RUN pip install flask
#WORKDIR /app
#COPY app.py /app/app.py
#ENTRYPOINT ["python"]
#CMD ["/app/app.py"]
