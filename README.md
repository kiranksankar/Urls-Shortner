# url_shortner

## Description
This is a simple URL shortener application built with Ruby on Rails for the backend and React for the frontend.

## Features

Shorten long URLs.
Shorten Multiple URLs at a time.
Shorten Multiple URLs from upload(file should be of format csv).


## How This Works
The given URL is shortened to 4 digit random number and appended to the domain shorturl-oazb.onrender.com (for example https://shorturl-oazb.onrender.com/hgjt ). The short URL above will be stored in the database along with the original URL.
In the case of shortening multiple URLs at a time the long URLs should be seperated by a comma (","). The corresponding shortened url will be created and stored in the database for each original url it will create the corresponding unique shortened url.
In the case of shortening long URLs from a file the file should be of the format .csv. The short URL for each long URLs in the file will be shown in the next filesummary page along with the corresponding long URL.

## Prerequisites
Make sure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
- [Postgresql](https://www.postgresql.org/download/)
- [Node.js](https://nodejs.org/en/download/)
- [Yarn](https://yarnpkg.com/getting-started/install)



## Make sure you have the following installed in your system.

- Ruby -v 3.2.0
- Rails -v 7.1.2
- psql (postgreSQl) --version 14.10
- Nodejs -v 20.10.0
- Yarn -v 1.22.21
- npm -v 10.2.3 

## After that clone the repository and run following commands

- bundle install
- bundle exec rake assets:precompile
- bundle exec rake assets:clean
- bundle exec rake db:migrate

## after these commands you are good to go you can launch the website localy by running

rails s


## To View
You can access the project using the following link

https://shorturl-oazb.onrender.com/
