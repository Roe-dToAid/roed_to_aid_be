# Roe'd To Aid API
This project was built by students at [Turing School of Software and Design](https://turing.edu/). It is an original web app designed by combined Front End and Back End teams and its purpose is to help individuals seeking information on abortions in their state and help with identifying misinformation sites.

Visit our Front End Site!
[Roe'd To Aid](https://roed-to-aide-fe.herokuapp.com/)

Our Back End is hosted here and requires an API key to access:
[Roe'd To Aid API](https://roed-to-aide-be.herokuapp.com/)


## Prereqs
Built with:
  - Ruby 2.7.4
  - Rails 5.2.8.1
  - RSpec 3.11


## Setup
1. Ensure that you have the prerequisites or equivalent
2. Clone this repo and navigate to the root folder `cd roed_to_aid_be`
3. Run `bundle install`
4. Run `rails db:{drop,create,migrate,seed}`
5. (Optional) To run the test suite, run `bundle exec rspec`
6. Run `rails s`

You should now be able to hit the API endpoints using Postman or a similar tool.
Default host is `http://localhost:3000`


## Database Schema
![Database Schema Image](/images/roed_to_aid_database_schema.png "Database Schema Image")


## Endpoints

### RESTful
Documentation on Restful endpoints can be found here:
[Roed to Aid API Documentation on SwaggerHub](https://app.swaggerhub.com/apis/roed-to-aid/roed-to-aid/1.0.0)

### GraphQL
