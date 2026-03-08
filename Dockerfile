FROM  ruby:3.1.2
RUN apt-get update && apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      postgresql-client \
      npm
RUN mkdir /bike-fuel-simulator
WORKDIR /bike-fuel-simulator
ADD Gemfile /bike-fuel-simulator/Gemfile
ADD Gemfile.lock /bike-fuel-simulator/Gemfile.lock
RUN bundle install
ADD . /bike-fuel-simulator
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

# docker run -p 3000:3000 bike-fuel-simulatorでサーバー立ち上げ
