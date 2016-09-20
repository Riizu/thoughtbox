# ThoughtBox

ThoughtBox is the final assessment for Module 4 at the Turing School of Software and Design. It utilizes a Rails backend and jQuery to manage a collection 'Thoughts.' These thoughts have an associated Title, URL, and Read Status. Using the app users can add and modify thoughts, sort them via status or via alphabetical order.

The production link can be found below.

[Production](https://shielded-ravine-41755.herokuapp.com/)

## Setup

### Prerequisites

* Rails 5
* PostgreSQL

### Installation

1. Clone the repo
2. Run `rails db:setup` to add the databases to your local PostgreSQL Installation
3. Run `rails db:migrate` to add the relevant table schema
4. Run the server with `rails s`

### Testing

The entire application has been developed with TDD. As such, a test suite is included that relies upon RSpec, Selenium, and SimpleCov. 

**Note, in order use Selenium you must install Firefox, preferably version 47.0.1 which can be found [here](https://ftp.mozilla.org/pub/firefox/releases/47.0.1/mac/en-US/).**

In order to run the test suite, simply run the command, `rspec` from the root of the project directory and wait for it to finish. Selenium will auto boot Firefox when necessary.

You may also check the current test coverage using SimpleCov, either through the automatic output at the end of running the tests, or via the web tool, which can be opened by running `open coverage/index.html` from the command line.