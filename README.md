# Guestlist

This app will generate an invite list of all customers within a radius of the Dublin HQ office.

To look through the code, the interesting bits are in `Guestlist`, `Importer` and `Location`. Input validation happens in `InputValidator`. The distance calculation happens in `Location`. The entry point for the app is `main.rb`.

The example output can be found in `output.txt`.

## Installation

You'll need a version of Ruby installed. If you have that, then:

```
gem install bundler && bundle install
```

## How to run

To run with the program, pass 2 arguments. The first one being the path to the file and the second being the distance in kilometres you want to use to filter the list of customers.

For example, to run the program with data in `"./data/customers.txt"` and find customers within 100km:

```
ruby main.rb ./data/customers.txt 100
```

or

```
ruby main.rb ./data/customers.txt 100km
```

## Runnings tests

```
bundle exec rspec
```
