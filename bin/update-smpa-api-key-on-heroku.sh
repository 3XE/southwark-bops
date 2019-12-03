#!/bin/sh
KEY=`curl \
	-F email="$SMPA_EMAIL" \
	-F password="$SMPA_PASSWORD" \
	https://smpaapi.hactar.is/api/v1/auth \
	| sed 's/.*"jwt":\s*"\([^"]*\)".*/\1/'`

curl \
	-H "Content-Type: application/json" \
	-H "Accept: application/vnd.heroku+json; version=3" \
	-H "Authorization: Bearer $HEROKU_API_KEY" \
	-X PATCH https://api.heroku.com/apps/$HEROKU_APP_NAME/config-vars \
	-d "{ \"SMPA_API_KEY\": \"$KEY\" }"
