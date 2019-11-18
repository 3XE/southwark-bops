Southwark BOPS
==============

This is the Southwark BOPS (Back Office Planning System), prototype.


Configuration
-------------

### Hackney SMPA API key

To login, run:

```sh
curl \
  -F email=$email \
  -F password=$password \
  https://smpaapi.hactar.is/api/v1/auth
```

then the output should contain:

```json
{
  "message": "login successful!",
  "jwt": "__VERY_LONG_API_KEY__"
  "user": {
    ...
  }
}
```

then export the API key to your environment or put it into your .env.local
file:

```sh
export SMPA_API_KEY=__VERY_LONG_API_KEY__
```


Running
-------

As a regular rails app, running the following line should do the trick:

```sh
bundle exec rails s
```
