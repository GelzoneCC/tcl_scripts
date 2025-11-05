proc ExportJSON {targetDict {indent 0}} {
  package require json::write
  
  set json_output "{\n"
  set keys [dict keys $targetDict]
  set num_keys [llength $keys]
  set key_index 0
  
  dict for {keyVar valVars} $targetDict {
	  incr key_index
	  
	  # Add indentation
	  append json_output "  \"$pageName\": \["
	  
	  # Convert the list to JSON array
	  set first 1
	  foreach val $valVars {
		  if {!$first} {
			  append json_output ", "
		  }
		  # Check if item is a number or string and format accordingly
		  if {[string is integer -strict $val] || [string is double -strict $val]} {
			  append json_output $val
		  } else {
			  # Escape special characters in strings
			  set escaped_item [string map {\" \\\" \\ \\\\ \n \\n \r \\r \t \\t} $val]
			  append json_output "\"$escaped_item\""
		  }
		  set first 0
	  }
	  append json_output "\]"
	  
	  # Add comma if not the last key
	  if {$key_index < $num_keys} {
		  append json_output ","
	  }
	  append json_output "\n"
  }
  
  append json_output "}"
  return $json_output
}
