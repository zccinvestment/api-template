FROM python:alpine3.7

COPY requirements.txt .

RUN pip install  --no-cache-dir -r requirements.txt

RUN mkdir -p /app
WORKDIR /app
COPY . .

ENV HOST 0.0.0.0
ENV PORT 5000
ENV SUGGESTION_NUMBER 10

EXPOSE $PORT

CMD [ "python","-m", "app.app" ]
