	
	      ____           __         __   _____                            __            
	     / __/___  ____ / /__ ___  / /_ / ___/___   ___   ___  ___  ____ / /_ ___   ____
	    _\ \ / _ \/ __//  '_// -_)/ __// /__ / _ \ / _ \ / _ \/ -_)/ __// __// _ \ / __/
	   /___/ \___/\__//_/\_\ \__/ \__/ \___/ \___//_//_//_//_/\__/ \__/ \__/ \___//_/   
	
	   Injects a Socket.IO-Connection to your favorite website.

### Why

Once, someone said: _"There is an app for that!"_ No, not really!! Not an API or a Webservice, no XML, no JSON. You have to do it on your own…  
User-Scripts / Browser-Extensions are perfect for this. Imagine, you could add your fancy jQuery-Plugin to any page you want, fetch your Data and send it down the short path via [Socket.IO](http://socket.io/) and [nodejs](http://nodejs.org). But how can you connect both sides?  
Just give it a try!


### How

```coffeescript
new SocketConnector "http://localhost", 3000, (socket) ->

	# You're in! Add your stuff like you always do…
	socket.on "foo", ->
		console.log "bar"
```

### Have Fun!