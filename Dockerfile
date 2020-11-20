FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /todo
COPY Gemfile /todo/Gemfile
COPY Gemfile.lock /todo/Gemfile.lock
RUN bundle install
COPY . /todo 

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh 
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]