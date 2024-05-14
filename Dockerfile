FROM python:3.10

WORKDIR /app

COPY . .

COPY requirements.txt .

RUN pip install  -r requirements.txt


ENV FLASK_APP=/app/core/server.py

RUN rm -f core/store.sqlite3

RUN flask db upgrade -d /app/core/migrations/

COPY run.sh .
RUN chmod +x run.sh

EXPOSE 7755

CMD ["./run.sh"]