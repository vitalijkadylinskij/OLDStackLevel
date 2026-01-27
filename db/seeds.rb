# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

technologies = {
  bootstrap: 'Bootstrap',
  mongo: 'Mongo',
  webpack: 'Webpack',
  javascript: 'JavaScript',
  resque: 'Resque',
  psql: 'PostgreSQL',
  aws: 'AWS',
  zabbix: 'Zabbix',
  sass: 'Sass',
  googlemapsjs: 'Google Maps JS',
  jquery: 'jQuery',
  chef: 'Chef',
  haml: 'Haml',
  angular: 'Angular',
  symfony: 'Symfony',
  newrelic: 'Newrelic',
  memcache: 'Memcache',
  highcharts: 'Highcharts',
  ruby: 'Ruby',
  yandexmaps: 'Yandex Maps',
  heroku: 'Heroku',
  docker: 'Docker',
  mailchimp: 'Mailchimp',
  googlemaps: 'Google Maps',
  coffee: 'Coffee',
  mailtrap: 'Mailtrap',
  googleplacesapi: 'Google Places API',
  rabbit: 'RabbitMQ',
  googledistancematrixapi: 'Google Distance Matrix API',
  mandrill: 'Mandrill',
  'delayed-job': 'Delayed-Job',
  twilio: 'Twilio',
  'redux-saga': 'Redux-Saga',
  sidekiq: 'Sidekiq',
  facebook: 'Facebook',
  jest: 'Jest',
  capistrano: 'Capistrano',
  jenkins: 'Jenkins',
  redux: 'Redux.js',
  rails: 'Ruby on Rails',
  googleauth: 'Googl Eauth',
  googleanalytics: 'Google Analytics',
  redis: 'Redis',
  react: 'React.js',
  twitter: 'Twitter',
  ansible: 'Ansible',
  css3: 'CSS 3',
  apollo: 'Apollo',
  debian: 'Debian',
  html: 'HTML 5',
  php7: 'PHP 7',
  mysql: 'MySQL',
  googledirectionsapi: 'Google Directions API',
  circleci: 'CircleCI',
  graphql: 'GraphQL',
  digitalocean: 'DigitalOcean',
  node: 'Node.js',
  golang: 'Golang'
}

business_domains = {
  banking: 'Banking',
  logistics: 'Logistics',
  government: 'Government',
  ecommerce: 'E-Commerce',
  retail: 'Retail',
  interprice: 'Interprice',
  outsource: 'Out-source'
}

business_domains.each do |item|
  BusinessDomain.create(name: item[1])
end

technologies_path = Dir.new(File.path(Rails.root + 'app/assets/images/technologies'))
technologies_path.each do |file|
  if file != '.' && file != '..'
    technology = Technology.find_or_create_by(alias_name: File.basename(file, ".svg"), logo: file)
    technology.update(name: technologies[File.basename(file, ".svg").to_sym])
    integration = Integration.find_or_create_by(alias_name: File.basename(file, ".svg"), logo: file)
    integration.update(name: technologies[File.basename(file, ".svg").to_sym])
    framework = Framework.find_or_create_by(alias_name: File.basename(file, ".svg"))
    framework.update(name: technologies[File.basename(file, ".svg").to_sym])
  end
end

