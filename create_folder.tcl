proc CreateFolder {folderPath} {
	# Create a folder path.
	set isdir [file isdirectory $folderPath]
	if {$isdir eq 0} {
		file mkdir $folderPath
	}
}
