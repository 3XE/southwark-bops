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
`SMPA_API_KEY`          | Hackney SMPA api key
`MAPBOX_ACCESS_TOKEN`   | Mapbox access token
`BASIC_AUTH_USER`       | Username to login to app (blank to allow public)
`BASIC_AUTH_PASS`       | Password to login to app (blank to allow public)


Running
-------

As a regular rails app, running the following line should do the trick:

```sh
bundle exec rails s
```
