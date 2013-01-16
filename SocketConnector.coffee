
###
 # SocketConnector
 #
 # @package Google144.UserScript
###

class SocketConnector

	constructor: (host, port, @callback) ->
		@host = host or 'http://localhost'
		@port = port or 3000
		self = @

		window.addEventListener 'load', () ->
			self.loadLibraries()


	# ! Getters

	getBase: () ->
		"#{@host}:#{@port}"

	getWindow: () ->
		unsaveWindow ? window


	# ! Public Methods

	loadLibraries: () ->
		# dynamically creates a script tag
		proto = document.createElement 'script'
		proto.type = 'text/javascript'
		proto.src = @getBase() + '/socket.io/socket.io.js'

		# add to header
		dhead = document.getElementsByTagName('head')[0] || document.documentElement
		dhead.insertBefore proto, dhead.firstChild

		# wait for libraries
		@waitForLibraries()

	waitForLibraries: () ->
		self = @
		win = self.getWindow()

		if typeof win.io is 'undefined'
			# set to check every 100 milliseconds if the libary has loaded
			window.setTimeout () ->
				self.waitForLibraries()
			, 100
		else
			establishConnection.call self, win.io


	# ! Private Methods

	establishConnection = (io) ->
		@socket = io.connect @getBase()

		if @callback
			@callback @socket


# make it accessable
root = exports ? window
root.SocketConnector = SocketConnector