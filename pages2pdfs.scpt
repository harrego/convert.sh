set folder_ to (choose folder)
tell application "Finder" to set listedFiles to every item in folder_
repeat with elem in listedFiles
	local elem_, elemAlias, cl_, typeId_
	set elem_ to elem as text
	set elemAlias to elem as alias
	
	tell application "System Events"
		set typeId to type identifier of (elem as alias)
		if typeId is "com.apple.iwork.pages.sffpages" then
			tell application "Pages"
				set basename to name of elem as Unicode text
				set newName to (text 1 thru -6 of basename) & "pdf"
				set dest to (folder_ as Unicode text) & newName
				log dest
				
				open elem
				delay 1
				export front document to file dest as PDF
				close front document
			end tell
		end if
	end tell
end repeat
end
