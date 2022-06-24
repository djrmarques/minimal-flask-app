FROM python:latest

WORKDIR app/

COPY . .

RUN pip install --upgrade pip  
RUN make build

EXPOSE 5000

CMD make run
