# README
Application that aggregates website usage, to help track and monitor website statistics. Using Ruby on Rails for server-side API, and has a client-side Javascript snippet that allows a user to track events on a site.

Rails version 5.1.4

### javascript snippet to add to registered applications
```var dataworkz= {}
dataworkz.report = function(eventName){
 var event = {event: {name:eventName}};
 var request = new XMLHttpRequest();
 request.open("POST", "http://localhost:3000/api/events", true)
 request.setRequestHeader('Content-Type', 'application/json');
 request.send(JSON.stringify(event));
};
```
