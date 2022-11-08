
# .\hash_table_key_value_exec0.ps1
# 
# Purpose:
# 	executes functions by calling them
#
# Imported scripts: 
#--------------------
# "." is used in order to be able to call specific functions in the script
<#
$full_path_file1 = get-childitem  array_elem_position_comb.ps1  | select-object fullname
$full_path_file2 = get-childitem  hash_table_key_value_maker.ps1  | select-object fullname
$full_path_file3 = get-childitem  hash_table_key_value_display.ps1  | select-object fullname
. $full_path_file1
. $full_path_file2
. $full_path_file3
#>
. C:\Users\kolo0\Dropbox\Everything\Classes\my_notes\programming\cmd\ps_scripts\scrpt_cls\hash_table_key_value\array_elem_position_comb.ps1
. C:\Users\kolo0\Dropbox\Everything\Classes\my_notes\programming\cmd\ps_scripts\scrpt_cls\hash_table_key_value\hash_table_key_value_maker.ps1
. C:\Users\kolo0\Dropbox\Everything\Classes\my_notes\programming\cmd\ps_scripts\scrpt_cls\hash_table_key_value\hash_table_key_value_display.ps1
#
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
<# 
# makeing the HashTable an object:
$Object_from_table = [pscustomobject]$TableKeyList
write-host $Object_from_table

$csv_path = "temp_test_csv_.csv"
$Object_from_table |export-csv  -path $csv_path
invoke-item -path $csv_path
# ------------------------------
#>
