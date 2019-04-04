# DataWorkz
Application that aggregates website usage, to help track and monitor website statistics. Using Ruby on Rails for server-side API. A user can register a third party site to the API which will then return a client-side Javascript snippet that -when added to the third party site- allows cross site communication and sends data to Dataworkz to store. 

rails version 5.2.2.1

## DEVELOPERS
### Setting up the repo locally on Mac
1. Clone it: In the directory you want to put the repo
  `git clone https://github.com/wolffles/DataWorkz.git`
2. cd into the project
3. install dependencies

    `bundle install`
4. create the DB, migrate, and seed it

    `rake db:create` 

    `rake db:migrate`

    `rake db:seed`
5. You should be able to start the DB at this point.

    `postgres -D /usr/local/var/postgres`

    press cmd+c to stop the database. and exit. 
6. in another terminal tab start the rails server. 

    `rails s`


### example of javascript snippet to add to registered applications
```var dataworkz= {}
dataworkz.report = function(eventName){
 var event = {event: {name:eventName}};
 var request = new XMLHttpRequest();
 request.open("POST", "http://localhost:3000/api/events", true)
 request.setRequestHeader('Content-Type', 'application/json');
 request.send(JSON.stringify(event));
};
```
