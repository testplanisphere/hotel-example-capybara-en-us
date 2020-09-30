# hotel-example-capybara-en-us

![capybara-en-us](https://github.com/testplanisphere/hotel-example-capybara-en-us/workflows/capybara-en-us/badge.svg)

This project is example codes for learning test automation.

### System under test

https://hotel.testplanisphere.dev/en-US/

### Overview

#### Programming Language

* Ruby

#### Automation Framework

* [Capybara](https://teamcapybara.github.io/capybara/)
* [SitePrism](https://github.com/site-prism/site_prism)

#### Testing Framework

* [RSpec](https://rspec.info/)

#### Build Tool

* [Rake](https://ruby.github.io/rake/)
* [Bundler](https://bundler.io/)

#### Lint Tool

* [RuboCop](https://docs.rubocop.org/)

### How to Run

#### Requirements

* Ruby 2.6
* Google Chrome

#### Install Dependencies

```
gem install bundler
bundle install
```

#### Run Tests

```
bundle exec rake
```

#### Run lint

```
bundle exec rake rubocop
```

### Changelog

#### v2020.9.0 (2020-09-30)

* [#8](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/8) Bump rubocop from 0.89.1 to 0.91.1 
* [#9](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/9) Bump rubocop from 0.91.1 to 0.92.0

#### v2020.8.0 (2020-08-31)

* [#4](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/4) Bump rubocop from 0.88.0 to 0.89.1

#### v2020.7.0 (2020-07-26)

* First release
