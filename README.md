This app for managing projects and tasks was developed as a homework during job interview.

## How to run

1. Clone this repo and change into folder
    ```
    git clone git@github.com:sindpet/tasks-app.git
    cd tasks-app
    ```
1. Install dependencies
    ```
    bundle install
    ```
1. Make sure you have PostgreSQL database installed and its service running ([hint](https://www.theodinproject.com/lessons/ruby-on-rails-installing-postgresql#installing-postgresql)), then setup the needed database
    ```
    rails db:setup
    ```
1. (optional) Run the tests
    ```
    rspec
    ```
1. Start the server
    ```
    rails s
    ```
1. Either create your own account (sign up) and log in, or use sample account provided in ``db/seeds.rb`` to log in.
