# hotel-example-capybara-en-us

[![capybara-en-us](https://github.com/testplanisphere/hotel-example-capybara-en-us/actions/workflows/test.yml/badge.svg)](https://github.com/testplanisphere/hotel-example-capybara-en-us/actions/workflows/test.yml)

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

#### v2021.2.0 (2021-02-28)

* [#13](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/13) Bump site_prism from 3.4.2 to 3.7
* [#16](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/16) Bump rspec from 3.9.0 to 3.10.0
* [#27](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/27) Bump rake from 13.0.1 to 13.0.3
* [#33](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/33) Bump capybara from 3.33.0 to 3.35.3
* [#34](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/34) Bump rubocop from 0.92.0 to 1.9.1
* [#36](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/36) Update cache setting
* [#38](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/38) Bump ruby from 2.6 to 2.7
* [#39](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/39) Bump webdrivers from 4.4.1 to 4.5.0
* [#40](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/40) Bump rubocop from 1.9.1 to 1.10.0
* [#41](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/41) Bump site_prism from 3.7 to 3.7.1

#### v2020.9.0 (2020-09-30)

* [#8](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/8) Bump rubocop from 0.89.1 to 0.91.1 
* [#9](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/9) Bump rubocop from 0.91.1 to 0.92.0

#### v2020.8.0 (2020-08-31)

* [#4](https://github.com/testplanisphere/hotel-example-capybara-en-us/pull/4) Bump rubocop from 0.88.0 to 0.89.1

#### v2020.7.0 (2020-07-26)

* First release
