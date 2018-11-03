# Requirements

- Ruby 2.2.2
- SQLite 3

# Local setup

```bash
bundle install
```

# Instruction

In this task you need to implement a `Query` object that queries the database using Active Record models and returns the data in desired format.
There is single basic test that checks that your presenter returns data in desired shape.

## Important files

To check what properties you can expect in models please look at `db/schema.rb` file.

To check how the desired output should look like please look at `spec/expected_query_result.rb` file.

## Addtional requirements

* The whole process of data retrievel should be done in fixed number of queries, independent from number of rows in the database
* All time fields should be instances of `Time` object
* Posts have to be ordered from newest to oldest
* Comments in post have to be ordered from oldest to newest

## Non trivial fields in the output

* `post -> last_comment_at`: `posted_at` property of the most recent comment
* `post -> number_of_comments`: number of all comments attached to this post
* `author -> full_name`: concatenation of users `first_names` and `last_names` with a single space in between
* `author -> age`: users age in full years, relative to the `today` argument passed to `get` method
* `author -> number_of_comments`: number of all comments created by this user

# Run tests

```bash
bundle exec rspec
```
