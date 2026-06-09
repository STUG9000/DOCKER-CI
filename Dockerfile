FROM ubuntu:latest

EXPOSE 8000

WORKDIR /app

ENV HOST=localhost DBPORT=5432
ENV USER=root PASSW=root DBNAME=root


COPY ./main.exe main.exe

CMD [ "./main" ] 
