Southwark BOPS
==============

This Southwark BOPS (Back Office Planning System) prototype is a proof of
concept of integration with the Hackney SMPA (Submit My Planning Application).

It is capable of displaying a list of all applications exposed on the SMPA API
and giving some details for each of them:

* summary of proposal
* property details:
  - address
  - property type
  - whether it's a listed building
  - whether it's in a conservation area
* map with property boundaries
* uploaded documents


Configuration
-------------

### Environment variables

The following environment variables must be present:

Variable                | Description
----------------------- | ---------------------
`SMPA_API_KEY`          | Hackney SMPA API key
`MAPBOX_ACCESS_TOKEN`   | Mapbox access token
`BASIC_AUTH_USER`       | Username to login to app (blank to allow public)
`BASIC_AUTH_PASS`       | Password to login to app (blank to allow public)


### Automatically update SMPA API key on Heroku

In case you are running under Heroku and need to automatically update the SMPA
API key, you can use the script in `bin/update-smpa-api-key-on-heroku.sh`. It
requires some variables to be set:

Variable                | Description
----------------------- | ---------------------
`HEROKU_API_KEY`        | Heroku API key
`HEROKU_APP_NAME`       | Name of the Heroku app to have the environment updated
`SMPA_EMAIL`            | Email to login to SMPA backend
`SMPA_PASSWORD`         | Password to login to SMPA backend

You're probably interested in adding it to the heroku scheduler addon:

```sh
heroku addons:create scheduler:standard
heroku addons:open scheduler
```


Running
-------

As a regular rails app, running the following line should do the trick:

```sh
bundle exec rails s
```
