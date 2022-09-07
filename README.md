<center>
  <h1>Roe'd To Aid API</h1>
  <img src="images/roed_logo_sm.png" alt_text="Roed to Aid Logo"><br>
</center>

(Want to hire the devs that worked on this project? Click [this link](#contributors) to jump to our project contributors!)<br>

This repo is the Back End part of a project built by students at [Turing School of Software and Design](https://turing.edu/). The project itself is an original web app designed by combined Front End and Back End teams and its purpose is to help individuals seeking information on abortions in their state and help with identifying misinformation sites.

Visit our Front End Site!
- [Roe'd To Aid](https://roed-to-aide-fe.herokuapp.com/)

Our Back End is hosted here and requires an API key to access (we are not giving any API keys out at this time):
- [Roe'd To Aid API](https://roed-to-aide-be.herokuapp.com/)

<br></br>
## Built With:
- ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) **2.7.4**
- ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) **5.2.8.1**
- <img src="images/rspec_badge.png" alt="RSpec" height="30"> **3.11**
- ![GraphQL](https://img.shields.io/badge/-GraphQL-E10098?style=for-the-badge&logo=graphql&logoColor=white)
- ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
- ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)

<br></br>
## Setup
If you'd like to demo this API on your local machine:
1. Ensure that you have the prerequisites or equivalent
2. Clone this repo and navigate to the root folder `cd roed_to_aid_be`
3. Run `bundle install`
4. Run `rails db:{drop,create,migrate,seed}`
5. (Optional) To run the test suite, run `bundle exec rspec`
6. Run `rails s`

You should now be able to hit the API endpoints using Postman or a similar tool.<br>
Default host is `http://localhost:3000`

<br></br>
## Database Schema
![Database Schema Image](/images/roed_to_aid_database_schema.png "Database Schema Image")

<br></br>
## Endpoints
### RESTful
https://roed-to-aide-be.herokuapp.com/api/v1<br>
Documentation on Restful endpoints can be found here:
[Roed to Aid API Documentation on SwaggerHub](https://app.swaggerhub.com/apis/roed-to-aid/roed-to-aid/1.0.0)

### GraphQL
https://roed-to-aide-be.herokuapp.com/graphql<br>
The GraphQL endpoints supply information based on all states or an individual state. An individual state's information can be looked up using the state's two letter abbreviation.(e.g. Texas = TX, New Mexico = NM, Indiana = IN, Wasington DC = DC, United States = US, etc.)<br>
The API key should be sent in the params of the request as shown in the examples and the query should be sent in the body. Below are some examples of queries that can be used.
- All States
  - POST https://roed-to-aide-be.herokuapp.com/graphql?api_key=API_KEY_HERE
  - ```
    query {
      states {
        id
        name
        abbreviation
        legal
        legalDescription
        source
        authorizedClinics {
          id
          stateId
          name
          address
          city
          zip
          phone
          services
          website
          source
        }
        misinformationCenters {
          id
          stateId
          name
          address
          city
          zip
          source
        }
        resources {
          id
          stateId
          name
          website
          service
          active
          bipocFocus
        }
      }
    }
    ```
- Single State
  - Very similar to all states, except here you need to specify which state to pull information for on the second line. Everything else should remain the same for this query.
  - POST https://roed-to-aide-be.herokuapp.com/graphql?api_key=API_KEY_HERE
  - ```
    query {
      state(abbreviation: "NM") {
        id
        name
        abbreviation
        legal
        legalDescription
        source
        authorizedClinics {
          id
          stateId
          name
          address
          city
          zip
          phone
          services
          website
          source
        }
        misinformationCenters {
          id
          stateId
          name
          address
          city
          zip
          source
        }
        resources {
          id
          stateId
          name
          website
          service
          active
          bipocFocus
        }
      }
    }
    ```

<br></br>
## Contributors
### Back End Team
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/85247765?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/98674727?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/98676136?s=120&v=4"></td>
  </tr>
  <tr>
    <td>Bryce Wein</td>
    <td>Casey Fazio</td>
    <td>Wesley Garcia</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/bwbolt">GitHub</a><br>
      <a href="https://www.linkedin.com/in/bryce-wein/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/casefaz">GitHub</a><br>
      <a href="https://www.linkedin.com/in/casey-fazio-7ba04149/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/wesatt">GitHub</a><br>
      <a href="https://www.linkedin.com/in/wesley-garcia-attech/">LinkedIn</a>
    </td>
  </tr>
</table>


### Front End Team
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/98493391?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/90080658?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/99596577?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/98505112?s=120&v=4"></td>
  </tr>
  <tr>
    <td>Catlyn Bowles</td>
    <td>Irmak Erdem</td>
    <td>Lidia Karpinski</td>
    <td>Rachel Allen</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/catlynbowles">GitHub</a><br>
      <a href="https://www.linkedin.com/in/catlyn-bowles/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/irmakerdem">GitHub</a><br>
      <a href="https://www.linkedin.com/in/irmakerdem/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/lkarpins">GitHub</a><br>
      <a href="https://www.linkedin.com/in/lidia-karpinski/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Rallen13">GitHub</a><br>
      <a href="https://www.linkedin.com/in/rachel-lynn-allen/">LinkedIn</a>
    </td>
  </tr>
</table>

### Instructor/Project Manager
Mike Dao
