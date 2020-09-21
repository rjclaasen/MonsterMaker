# Monster Maker

This is a website dedicated to the creation of Monsters in Dungeons and Dragons 5th edition.

Very WIP, currently only intended for personal use. A temporary somewhat live version of this repository can be found [here](https://monstermaker.herokuapp.com/).

## License

All source code is available under the GNU General Public License. See [LICENSE](LICENSE) for details.

## Dependencies

* Ruby (and Bundler)
* PostgreSQL
* Node.js
* Yarn

## Getting started

To run Monster Maker yourself, clone the repo and then install the needed dependencies:
```
$ bundle install
$ yarn install
```
Then set up the database:
```
$ rails db:create
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rspec
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
