FROM ubuntu
RUN apt update
RUN apt install -y python
RUN echo 1.0 >> /etc/version && apt install -y git && apt install -y iputils-ping
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
WORKDIR /datos1
RUN touch f2.txt

#COPY
COPY index.html .
COPY app.log /datos/

#ADD
ADD docs docs
ADD f* /datos/
ADD f.tar .

#ENV
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir1

#ARG
#ARG dir2
#RUN mkdir $dir2
#ARG user
#ENV user_docker $user
#ADD add_user.sh /datos1
#RUN /datos1/add_user.sh

#EXPOSE
RUN apt update
RUN apt install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1

#VOLUME
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

#CMD
CMD /datos1/entrypoint.sh

#ENTRYPOINT#
#ENTRYPOINT ["/bin/bash"]

