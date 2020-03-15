# Pharmacy Location Engine

Engine for determining (relative) locations for pharmacies

## API

This engine provides, as of now, a single route for determining the closest pharmacy to given latitude and longitude coordinates.

* [Nearest Pharmacy](site/Pharmacy-Nearest-API-Documentation.md)

## Setup

Ensure you have the same version as below
* Ruby Version ~> 2.6.3
* Rails Version ~> 6.0.2.1
* Node Version ~> 13.11.00

1. Clone repo and install gems

<pre>
git clone
</pre>

2. `cd` into pharmacy_location_engine directory

<pre>
bundle install
</pre>

### Seeding database

The very first time run

<pre>
rake db:migrate
rake db:setup
</pre>

then if you change the seed data later you can simply just run

<pre>
rake db:seed
</pre>

The [seed data](lib/seeds/pharmacies.csv) is in /lib/seeds.

## Testing

To run the entire test suite:

<pre>
bundle exec rspec
</pre>

## Linting

Ensure rubocop is installed in your environment

<pre>
gem install rubocop
</pre>

then use `rubocop` to lint all files.

To lint all ruby files in the directory. There should always be 0 warnings and 0 errors before opening a pull request or merging.
[.rubocop.yml](.rubocop.yml) includes altered or disabled default rubocop rules.

## Running Locally for Development

1. Make sure steps in the [Setup Section](#Setup) have been follow
2. Run `bundle exec rails s`
3. In a web browser navigate to `localhost:3000`
4. See [Site](site/) for available endpoints

Most files can be edited and saved while server is running and automatically hotload the changes.

