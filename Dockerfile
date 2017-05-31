FROM phusion/passenger-customizable:0.9.21
RUN /pd_build/utilities.sh
RUN /pd_build/ruby-2.3.3.sh
RUN /pd_build/nodejs.sh

# Install/Update Base System Libraryes
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set correct environment variables.
ENV HOME /root

# Setup Folders
ENV APP_HOME /home/app
ENV SERVER_HOME $APP_HOME/rails-api
ENV API_HOME $APP_HOME/node-api
RUN mkdir -p $SERVER_HOME && mkdir -p $API_HOME

# rails app bundle install
WORKDIR /bundle
ADD server/Gemfile Gemfile
ADD server/Gemfile.lock Gemfile.lock
RUN bash -lc 'rvm --default use ruby-2.3.3' && gem install bundler && bundle install --system --full-index

# express npm
ENV NODE_PATH "/npm/node_modules"
WORKDIR /npm
ADD api/package.json package.json
RUN npm install

# Start Nginx and Passenger
EXPOSE 80
RUN rm -fv /etc/service/nginx/down && rm -fv /etc/nginx/sites-enabled/default
ADD server/nginx/omg_server.conf /etc/nginx/sites-enabled/omg_server.conf
ADD server/nginx/omg_node.conf /etc/nginx/sites-enabled/omg_node.conf
ADD server/nginx/rails-env.conf /etc/nginx/main.d/rails-env.conf

##################################################################
# Use another docker instance to continuously build the frontend #
# or write some service to do it on this machine.                #
##################################################################

WORKDIR $SERVER_HOME
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
