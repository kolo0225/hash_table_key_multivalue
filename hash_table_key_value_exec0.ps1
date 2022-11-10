
# .\hash_table_key_value_exec0.ps1
# 
# Purpose:
# 	executes functions by calling them
#
# Imported scripts: 
#--------------------
# "." is used in order to be able to call specific functions in the script

$full_path_file1 = (get-childitem  array_elem_position_comb.ps1).fullname
$full_path_file2 = (get-childitem  hash_table_key_value_maker.ps1).fullname
$full_path_file3 = (get-childitem  hash_table_key_value_display.ps1).fullname
. $full_path_file1
. $full_path_file2
. $full_path_file3

# -----------------------------------------------
# operation center:
# -----------------------------------------------
# -----------------------------------------------
# ans:
# ----
# way0  => key = value
# way2  => .add(key,value)
# way3  => hash[key] = value
# way4  => hash.key = value    # does not work
#	--> MANUAL
$method            = 'way'+'1'

# ans:
# ----
# object    +> ??
# int       => 32-bit signed integer
# string    => str

# creates arrays from file.txt;
# ------------------------------
$key_filename      = 'hash_table_key_var.txt'
 
#       --> MANUAL ([data type]
# key
[System.Collections.Generic.List[string]]$list_key     = get-content $key_filename
# values
$list_tot_mixed = make-matrix

<#
# ------------------------------ 
# tests for hand created 1d or 2d arrys
[system.collections.arraylist]$list_key = @('tasos','lisa')
# tests a multivalue table 2d
#[system.collections.arraylist]$list_2d_value = @(@(11, 12,13,14),@(1, 2,3,4))
# tests a singlevalue table 1d
[system.collections.arraylist]$list_2d_value = @(44,12)
# ------------------------------ 
#>

# ===========================================================================
# call functions:
# ------------------------------ 
# tests for hand created 1d or 2d arrys
#$TableKeyList = array-loop $list_key $list_2d_value $method 
# ------------------------------

$TableKeyList = array-loop $list_key $list_tot_mixed $method 
display-hashtable ($TableKeyList)


# ------------------------------ 
# makeing the HashTable an object:
#$Object_from_table = [pscustomobject]$TableKeyList | ConvertTo-Csv 
#write-host $Object_from_table

# hashtable to csv
$csv_path = "temp_test_csv_.csv"
$json_path = "temp_test_json_.json"
#$TableKeyList.GetEnumerator() | foreach-object {$_.} |foreach-object {$_} | export-csv  -notypeinformation -path $csv_path
#$TableKeyList.GetEnumerator()|foreach-object {$_[1]} | export-csv  -notypeinformation -path $csv_path
#$json = $TableKeyList| ConvertTo-Json -Depth 2
#$json
#invoke-item -path $csv_path

# try hashtable with for loop to create scv but DOES NOT WORK 
<#
for ($i=0; $i -lt $TableKeyList.count; $i++)
	{
	#write-host "key = " $list_key[$i]
	export-csv -notypeinformation -path $csv_path [pscustomobject]$TableKeyList[$list_key[$i]] 
	#rite-host $TableKeyList[$i].key.gettype()
	for ($j=0; $j -lt $TableKeyList[$list_key[$i]].count; $j++)
		{ 
	#	$TableKeyList[$list_key[$i]][$j] | export-csv -notypeinformation -path $csv_path -append
		}

	}

invoke-item -path $csv_path
#>

# object to scv
#$csv_path = "temp_test_csv_.csv"
#$Object_from_table |export-csv  -path $csv_path
#invoke-item -path $csv_path
# ------------------------------
#>
<#
# convert to jpson ->convert to csv
$json = $TableKeyList| ConvertTo-Json -Depth 2
$json| out-file -FilePath $json_path
Get-Content -path $json_path | ConvertFrom-Json | foreach-object {System.Object[$_]}|ConvertTo-Csv | Out-File $csv_path

#invoke-item -path $json_path
invoke-item -path $csv_path
#>
