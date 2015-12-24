/etc/init.d/postgresql start;
/etc/init.d/redis-server start;

sudo -u postgres psql -c "CREATE DATABASE asciinema;"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

# Setup
rbenv exec bundle exec rake db:setup

rbenv exec bundle exec sidekiq &
rbenv exec bundle exec rails server
