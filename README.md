# papatoo
Is a information blog for parents
## The objectives are:
- bring non biased / neutral information to users on parenthood
- provide a comunity to new (ish) parents

## Run RSpec tests
- tests are split into either model tests and feature tests.

- run all tests with:
    `rspec spec`
  to run all model tests or all feature tests:
    `rspec spec/model_specs`
    `rspec spec/feature_spec`
  run individual tests with:
    `rspec spec/<path_for_spec>`
  to run a specific test like this one for the article model:
    `rspec spec/models_spec/article_specs/articles_spec`
