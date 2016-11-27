# mongo-setup-utils

**mongo-setup-utils** contains common scripts and utilities for performing tasks related to setup a MongoDB instances. This can collectively contain

  - System Tuning utilities
  - Installation and Post Installation scripts
  - Database tools (initialization, configuration, etc)
  - Other things related to MongoDB setup and running

You can also contribute to this by submitting a pull request for:
  - New Scripts or Utilities
  - Issues fix and improvements
  - Enhancement of existing scripts or Utilities

## Utilities

### mongoinit
Executes all mongo shell scripts (js files) in the folder mongofiles


**Usage**
```sh
$./mongoinit <host> <port> <user> <password>
```

*Example*
```sh
$./mongoinit localhost 27017 user pass
```

### mongodata
Imports all the json data in the folder mongofiles

**Usage**
```sh
$./mongodata <host> <port> <db> <user> <password>
```

*Example*
```sh
$./mongoinit localhost 27017 local user pass
```

### mongoscripts
Scripts required by MongoDB for maintenance and housekeeping. Can also be used to schedule scripts to run in fixed time from the folder mongoscripts

**Usage**
```sh
$./mongoscripts <host> <port> <db> <user> <password> [<script>]
```

*Example*
```sh
$./mongoscript localhost 27017 local user pass
```

License
----

GNU