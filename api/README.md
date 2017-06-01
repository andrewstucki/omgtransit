Configuring the API to run locally
========================================

```bash
$ cd omgtransit-public/api
$ NODE_ENV=local node app.js
```

Configuring the bulk updaters to run locally
========================================
Some of the transit systems, car2go, bikeshares, etc need to be bulk updated periodically.  The "updaters" background process will handle that.

```bash
$ cd omgtransit-public/api
$ NODE_ENV=local node background/updaters.js
```

NOTES
=====

API KEYS, ETC
=====
A .env file must be created at the root of the api folder with key/value pairs for the different systems.

```bash
MONGO_HOST=HOST_STRING
GCM_ANDROID_KEY=ADD_KEY_HERE
GOOGLE_MAPS_KEY=ADD_KEY_HERE
CAR2GO_KEY=ADD_KEY_HERE
CYCLOCITY_KEY=ADD_KEY_HERE
BCYCLE_KEY=ADD_KEY_HERE
BART_KEY=ADD_KEY_HERE
CTA_BUS_KEY=ADD_KEY_HERE
CTA_TRAIN_KEY=ADD_KEY_HERE
WDC_KEY=ADD_KEY_HERE
UBER_KEY=ADD_KEY_HERE
SIDECAR_KEY=ADD_KEY_HERE
HAILO_KEY=ADD_KEY_HERE
FORECAST_IO_KEY=ADD_KEY_HERE
```
