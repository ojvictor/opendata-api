# syntax=docker/dockerfile:1
FROM ruby:2.5.9

SHELL ["/bin/bash", "-c"]

ENV RAILS_ENV=development

RUN apt-get update -qq \ 
  && apt-get install -y --no-install-recommends build-essential curl libpq-dev postgresql-client \ 
  && $ curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get update -qq \ 
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
  && apt-get clean 

WORKDIR /ticweb-api
COPY Gemfile /ticweb-api/Gemfile
COPY Gemfile.lock /ticweb-api/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

# Configure the main process to run when running the image
CMD [ "rails", "server", "-b", "0.0.0.0" ]
