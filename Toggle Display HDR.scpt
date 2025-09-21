-- Apple Script to Toggle Display's HDR setting on/off
-- Tested on MacOS Tahoe 26.0 (Sep 2025)
-- Project Path: https://github.com/MrSimonC/Toggle-Mac-Display-HDR

open location "x-apple.systempreferences:com.apple.preference.displays"

tell application "System Events" to tell process "System Settings"
	# wait for window to exist
	repeat until window begins with "Displays" exists
	end repeat
	
	# wait until Panel is accessible
	repeat until exists of (1st window whose value of attribute "AXMain" is true)
	end repeat
	
	
	# --- HDR turned off
	try
		repeat until exists group 3 of scroll area 2 of group 1 of group 3 of splitter group 1 of group 1 of window "Displays"
		end repeat
		
		click checkbox "High Dynamic Range" of group 3 of scroll area 2 of group 1 of group 3 of splitter group 1 of group 1 of window "Displays" of application process "System Settings" of application "System Events"
	end try
	# --- HDR turned off
	
	# --- HDR turned on
	try
		repeat until exists group 4 of scroll area 2 of group 1 of group 3 of splitter group 1 of group 1 of window "Displays"
		end repeat
		
		click checkbox "High Dynamic Range" of group 4 of scroll area 2 of group 1 of group 3 of splitter group 1 of group 1 of window "Displays" of application process "System Settings" of application "System Events"
	end try
	# --- HDR turned on
	
	
end tell