proc SliceDict {dictionary chunkSize} {
	# Slice dict for the given chunk size. And store to list.
	set resultList {}
	set currentDict {}
	set count 0
	
	dict for {key value} $dictionary {
		dict set currentDict $key $value
		incr count
		
		if {$count >= $chunkSize} {
			lappend resultList $currentDict
			set currentDict {}
			set count 0
		}
	}
	
	# Add remaining items if any
	if {[dict size $currentDict] > 0} {
		lappend resultList $currentDict
	}
	
	return $resultList
}
