FROM centos
MAINTAINER Bobby Williams spikewilliams@gmail.com

RUN yum -y install git
RUN yum -y install gcc
RUN yum -y install make

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
    && cd ~/.rbenv \
    && src/configure \
    && make -C src

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

RUN yum -y install bzip2 openssl-devel readline-devel zlib-devel sqlite-devel

# A javascript runtime is required by the uglify gem
RUN curl --silent https://rpm.nodesource.com/setup_4.x | bash
RUN yum install -y nodejs
#

VOLUME ["/railsapps"]
COPY rootfs /


EXPOSE 3000
cmd rw4d_init

#RUN ~/.rbenv/bin/rbenv init
#RUN ~/.rbenv/bin/rbenv install list
