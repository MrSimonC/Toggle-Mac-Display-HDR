-- Apple Script (i.e. Use in Apple's Script Editor Application) to Toggle Display's HDR setting on/off
-- Tested on MacOS Ventura (13.4.1(c)) August 2023
-- Project Path: https://github.com/MrSimonC/Toggle-Mac-Display-HDR

open location "x-apple.systempreferences:com.apple.preference.displays"

tell application "System Events" to tell process "System Settings"
	# wait for window to exist
	repeat until window begins with "Displays" exists
	end repeat
	
	# wait until Panel is accessible
	repeat until exists of (1st window whose value of attribute "AXMain" is true)
	end repeat
	
	# wait until the group is displayed (needed else fails on Apple M2 Pro)
	repeat until exists group 3 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window "Displays"
	end repeat
	
	try
		click checkbox "High Dynamic Range" of group 3 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window "Displays" of application process "System Settings" of application "System Events"
	on error
		# This script interacts with the macOS System Settings application using AppleScript.
		# Specifically, it clicks the "High Dynamic Range" checkbox within the Displays settings.
		# When HDR is turned on, Brightness becomes an extra control.
		click checkbox "High Dynamic Range" of group 4 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window "Displays" of application process "System Settings" of application "System Events"
	end try
end tell

tell application "System Settings" to quit