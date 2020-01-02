FROM csig/qta-alpine-py3

MAINTAINER Peter Fisher

COPY ./app/requirements.txt /app/requirements.txt

WORKDIR /app

RUN apk add --update \
    py-mysqldb \
    gcc \
    libc-dev \
    mariadb-dev \
    nodejs \
    npm \
    && pip install --upgrade pip  \
    && pip install -r requirements.txt \
    && rm -rf /var/cache/apk/*

COPY ./app/package.json /app/package.json

RUN npm install

COPY ./app /app

CMD ["python", "app.py"]
