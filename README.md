# Probe API

Very simple API to return a list of SSIDs detected by snoopy-ng in JSON format.

Goes with an AngularJS SPA we use at conferences for displaying wireless probe details.

## Usage

### Installation

```
$ git clone https://github.com/4ARMED/probe-api.git
$ cd probe-api
$ bundle install
```

### Running

Specify the location of the snoopy-ng database (will default to /opt/snoopy-ng/snoopy.db).

```
$ export snoopy_db_file=/usr/share/snoopy-ng/snoopy.db
```

Run it in the usual way for a Sinatra app. At it's most basic just do:

```
$ ruby api.rb
```

Then in a browser request http://localhost:4567/probes.


