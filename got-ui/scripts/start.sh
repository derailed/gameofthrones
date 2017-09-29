#!/bin/sh

sed -i "s/change_me/${GOT_SVC_URL}/" /app/dist/main*.bundle.js

nginx -g "daemon off;"
