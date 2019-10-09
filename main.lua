local launch_args = ...
display.setStatusBar(display.HiddenStatusBar)

local json = require('json')
local widget = require('widget')
local chrometabs = require('plugin.chrometabs')

display.setDefault('background', 1)

local xl, xr, y = display.contentWidth * .25, display.contentWidth * .75, display.contentCenterY
local w, h = display.contentWidth * 0.4, 50

widget.newButton{
	x = xl, y = y - 200,
	width = w, height = h,
	label = 'Init',
	onRelease = function()
		print('init')
		chrometabs.init{
			listener = function(event)
				print(json.prettify(event))
			end
		}
	end}

widget.newButton{
	x = xr, y = y - 200,
	width = w, height = h,
	label = 'Open coronalabs.com',
	onRelease = function()
		print('show corona')
		chrometabs.show{
			url = 'https://coronalabs.com',
			shareMenu = true,
			urlBarHiding = true,
			instantApps = true,
			showTitle = true,
			startAnimation = "slide_right",
			exitAnimation = "slide_right",
			toolbarColor = {1, 0.1, 0.9},
			secondaryToolbarColor = {0.1, 0.9, 0.1}
		}
	end}

widget.newButton{
	x = xl, y = y - 120,
	width = w, height = h,
	label = 'Open google.com',
	onRelease = function()
		print('show google')
		chrometabs.show{
			url = 'https://google.com'
		}
	end}

widget.newButton{
	x = xr, y = y - 120,
	width = w, height = h,
	label = 'New Session',
	onRelease = function()
		print('new session')
		chrometabs.newSession()
	end}

widget.newButton{
	x = xl, y = y - 40,
	width = w, height = h,
	label = 'Warmup',
	onRelease = function()
		print('warmup')
		print(chrometabs.warmup())
	end}

widget.newButton{
	x = xr, y = y - 40,
	width = w, height = h,
	label = 'May Launch Url',
	onRelease = function()
		chrometabs.mayLaunchUrl('https://coronalabs.com', {'https://google.com'})
	end}
