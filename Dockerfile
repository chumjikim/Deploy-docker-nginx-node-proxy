FROM        insta-base
MAINTAINER  kcg9077@gmail.com

COPY        . /srv/app
COPY        .conf/uwsgi-app.ini         /etc/uwsgi/sites/app.ini
COPY        .conf/nginx.conf            /etc/nginx/nginx.conf
COPY        .conf/nginx-app.conf        /etc/nginx/sites-available/app.conf
COPY        .conf/supervisor-app.conf   /etc/supervisor/conf.d/
RUN         ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf


WORKDIR     /srv/app/django_app
EXPOSE      4567
CMD         ["supervisord", "-n"]