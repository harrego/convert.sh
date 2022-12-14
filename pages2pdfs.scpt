(*
pages2pdfs.scpt

convert.sh
https://github.com/harrego/convert.sh

Batch convert .pages documents to .pdf files.

Open the script in Script Editor on macOS and run it, select a folder containing `.pages` documents and let it convert each one.

ACKNOWLEDGEMENTS:

Magnus Lewan
http://pagesfaq.blogspot.com/2008/01/export-folder-to-word-rtf-pdf-txt-or.html

VikingOSX
https://discussions.apple.com/thread/251333833
*)

(*
MIT License

Copyright (c) 2022 Harry Stanton

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*)
set folder_ to (choose folder)
tell application "Finder" to set listedFiles to every item in folder_
repeat with elem in listedFiles
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
