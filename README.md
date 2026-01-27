# Pre-requirements
Install ruby using rvm: 
	https://rvm.io/rvm/install

Then install `gem bundler` for installing project dependencies:

	gem install bundler

Install and configure postgres (firs 3 steps):

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04

Install dev dependencies to prevent `gem pg` installing error:

	sudo apt-get install libpq-dev build-essential

To start/stop `postgresql service` use the following command:
  ```
  sudo service postgresql start / stop
  ```

# Configuring project:

Inside project dir run following commands.

Install dependencies:

	bundle install

Configuring database:

	rake db:setup

Database migration:

	rake db:migrate

Starting development server (by default site will be available on https://localhost:3000):

	rails s
	
