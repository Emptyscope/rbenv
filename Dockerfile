FROM ubuntu
MAINTAINER Brad Allen <brad@emptyscope.com>

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y curl git build-essential libssl-dev libffi-dev

RUN adduser --disabled-password --home=/ruby --gecos "" ruby

USER ruby

WORKDIR /ruby

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
ENV PATH /ruby/.rbenv/bin:/ruby/.rbenv/shims:$PATH


RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

CMD ["true"]
