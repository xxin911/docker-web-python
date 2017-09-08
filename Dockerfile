FROM python:2.7

MAINTAINER simpson <code-xx@foxmail.com>

EXPOSE 80 443

RUN mkdir /www \
    && cd /var/log \
    && touch uwsgi-out.log uwsgi-err.log nginx-out.log nginx-err.log flask.log \
    && touch /tmp/supervisord.log

WORKDIR /www/

COPY requirements.txt ./

RUN wget http://nginx.org/download/nginx-1.13.4.tar.gz \
    && tar -zxvf nginx-1.13.4.tar.gz \
    && cd nginx-1.13.4 \
    && ./configure --prefix=/usr/local/nginx \
    && make \
    && make install \
    && cd ../ \
    && rm -rf nginx-1.13.4 nginx-1.13.4.tar.gz \
    && pip install -r requirements.txt  -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple

COPY ./app ./app

COPY app_config.xml ./

COPY nginx.conf /usr/local/nginx/conf/

COPY supervisor.conf ./supervisor.conf

COPY run.sh ./run.sh

CMD ["sh", "run.sh"]