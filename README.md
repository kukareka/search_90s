CircleCI: [![CircleCI](https://circleci.com/gh/kukareka/search_90s.svg?style=svg)](https://circleci.com/gh/kukareka/search_90s)

# About

A simple command line application in Ruby to search the data and return the results in a human readable format.

# Dependencies

- Ruby 2.4.1 

# Installation

```
$ git clone git@github.com:kukareka/search_90s.git
$ cd search_90s
$ git checkout dev
$ gem install bundler
$ bundle install
$ rake db:setup
```

# Usage

```
$ thor search "first project"
$ thor search example -t user 
```

# Seeds

To change the seeds, edit the files in `db/seeds` and reset the database:

```
$ rake db:reset
```

Please take into account that the schema is not dynamic. Only the fields specified in the schema will be indexed.

To change the schema, please edit the corresponding model classes.

# Tests

Run the test suite:

```
$ rake
```

CircleCI: [![CircleCI](https://circleci.com/gh/kukareka/search_90s.svg?style=svg)](https://circleci.com/gh/kukareka/search_90s)

# Drawbacks and possible improvements

- Try optimized JSON parser (https://github.com/ohler55/oj).
- Delete unused terms after reindex.
- Support dynamic schema.
- Improve tokenizer (for phone numbers etc).
- Add stemmer.
- Command line tool to add new entities.
- Don't load all JSON to memory for extremely big datasets.
- Improve results formatting.
- Add results pagination.
