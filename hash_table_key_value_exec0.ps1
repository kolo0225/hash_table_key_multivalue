
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
. C:\Users\kolo0\git_dir_all\hash_table_key_multivalue\array_elem_position_comb.ps1
. C:\Users\kolo0\git_dir_all\hash_table_key_multivalue\hash_table_key_value_maker.ps1
. C:\Users\kolo0\git_dir_all\hash_table_key_multivalue\hash_table_key_value_display.ps1
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

# ---------------------------------------------
