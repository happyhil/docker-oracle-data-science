FROM ubuntu:18.04

# installing packages
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y nano
RUN apt-get install -y python3-pip python3-dev
RUN pip3 install --upgrade pip && pip3 install virtualenv
RUN apt install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && apt install -y python3.7
RUN apt-get install -y libaio1
RUN apt-get install -y git

# ssh configuration
RUN mkdir /var/run/sshd
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# instantclient setup
RUN mkdir -p /lib/oracle/instantclient_18_5
COPY oracle-datascience/instantclient_18_5/. /lib/oracle/instantclient_18_5
ENV LD_LIBRARY_PATH /lib/oracle/instantclient_18_5/:$LD_LIBRARY_PATH
ENV PATH /lib/oracle/instantclient_18_5/:$PATH
ENV NLS_LANG American_America.UTF8

EXPOSE 22 8080
CMD ["/usr/sbin/sshd", "-D"]
