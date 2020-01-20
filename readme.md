## Automated tests for an ecommerce demo site

This is a demo Ruby project showing the use of RSpec (a Ruby test framework)  and Capybara (a Selenium wrapper) to test the major features of a third-party demo ecommerce site at http://automationpractice.com/

I have used the FactoryBot gem to create factories and the Faker gem to generate random data.

To run this project you will need
* Ruby 2.1.2 or greater
* bundler

To install bundler:\
```gem install bundler```

To install the gems:\
```bundle install```

To run the tests:\
```bundle exec rspec```

You may find the tests run slowly due to the relatively slow speed of the site.

### My strategy

When creating these tests, my approach was to mimic an end user's view of the site under test as closely as possible. For example, some links are styled as buttons, so I used "click_on" rather than "click_button" or "click_link". I also chose to use text matchers over CSS wherever possible. This is because content on the site is unlikely to change, so there is a very low risk of tests breaking due to this.