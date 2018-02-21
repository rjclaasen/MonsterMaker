# GM-Tools

This might become a collection of tools for gamemastering. Currently it only contains the Monster Creator.

## License

All source code is available under the GNU General Public License. See [LICENSE](LICENSE) for details.

## Getting started

To run gm-tools yourself, clone the repo and then install the needed gems:
```
$ bundle install --without production
```
Next, migrate the database:
```
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```

<!--
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
-->
