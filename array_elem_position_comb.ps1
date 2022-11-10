
# array_elem_position_comb_a.ps1
#
# Purpose:
# 	creates a 2-d matix
# 	from elem in same index (as row)
# 	from multiple arrays
#
# ==================================================
#
function make-matrix ()
	{

	$valueA_filename   = 'hash_table_value_var_colA.txt'
	$valueB_filename   = 'hash_table_value_var_colB.txt'
	$valueC_filename   = 'hash_table_value_var_colC.txt'
	$valueD_filename   = 'hash_table_value_var_colD.txt'
	$valueE_filename   = 'hash_table_value_var_colE.txt'
	$valueF_filename   = 'hash_table_value_var_colF.txt'
	$valueG_filename   = 'hash_table_value_var_colG.txt'
	$valueH_filename   = 'hash_table_value_var_colH.txt'
	$valueI_filename   = 'hash_table_value_var_colI.txt'
	$valueJ_filename   = 'hash_table_value_var_colJ.txt'

	[System.Collections.Generic.List[String]]$list_valueA  = get-content $valueA_filename
	[System.Collections.Generic.List[string]]$list_valueB  = get-content $valueB_filename
	[System.Collections.Generic.List[string]]$list_valueC  = get-content $valueC_filename
	[System.Collections.Generic.List[string]]$list_valueD  = get-content $valueD_filename
	[System.Collections.Generic.List[string]]$list_valueE  = get-content $valueE_filename
	[System.Collections.Generic.List[string]]$list_valueF  = get-content $valueF_filename
	[System.Collections.Generic.List[string]]$list_valueG  = get-content $valueG_filename
	[System.Collections.Generic.List[string]]$list_valueH  = get-content $valueH_filename
	[System.Collections.Generic.List[string]]$list_valueI  = get-content $valueI_filename
	[System.Collections.Generic.List[string]]$list_valueJ  = get-content $valueJ_filename

	# Testing array 1d from file_in
	# -----------------------------
	#write-output $list_valueA.count
	#$list_valueA | foreach-object {write-output $_ $_.GetType()}
	# -----------------------------------------------------------	
	
	# all lists combined
	$list_tot = @(
		$list_valueA, $list_valueB,$list_valueC,
		 $list_valueD, $list_valueE,$list_valueF,
		  $list_valueG, $list_valueH,$list_valueI,
			$list_valueJ
					)


	# Testing combined 2d array from file_in
	# -----------------------------
	#write-output $list_tot
	#write-output $list_tot.length
	#write-output $list_tot.count
	#write-output $list_tot[0]
	#write-output $list_tot[0].length
	#write-output $list_tot[0].count
	#write-output $list_tot[2][2]


	#$list_tot | foreach-object {write-output $_ $_.GetType()}
	# ---------------------------------------------------------	
	
	# number of columns (file.txt) total
	# number of rows (entries max in file.txt)
	$col_max = 0
	for ($i=0; $i -lt  $list_tot.count; $i++)
		{
		#write-output $list_tot[$i].count
		#write-host $list_tot[$i].count '  -col, count' # this is the total number of rows
		#write-host $list_tot[$i].length '  -col, length' # this is the total number of rows
		#write-host ($i+1) '  -total number of rows'
		#write-host $list_tot[$i]
		if ($list_tot[$i].count -ne 0)
			{
			if ($list_tot[$i].length -ne 0)
				{
				$row_count = $i+1 # plus on since count starts at 1 no 0

				$col_count = $list_tot[$i].count
				#write-host $col_count
				if ($col_max -lt  $col_count)
					{
					$col_max = $col_count
					}
				}
			}
		}
		

	# Testing number of rows and number of col in 
	# -----------------------------
	#write-host $row_count  '  -row' # this is the total number of rows
	#write-host $col_count  
	#write-host $col_max    '  -col' # this is the total number of cols
	# --------------------------------------------------------

	[system.collections.arraylist]$list_tot_trim = @()
	for ($i=0; $i -lt  $list_tot.count; $i++)
		{
		#write-output $list_tot[$i].count
		if ($list_tot[$i].count -ne 0)
			{

			if ($list_tot[$i].length -ne 0)
				{
				[void]$list_tot_trim.add($list_tot[$i])

				#write-host $list_tot[$i].count '  -col, count' # this is the total number of rows
				#write-host $list_tot[$i].length '  -col, length' # this is the total number of rows
				#write-host ($i+1) '  -total number of rows'
				#write-host $list_tot[$i]
				#write-host $list_tot_trim
				}
			}
		}

	# Testing the results of trim array (array with no null entries) 
	# -----------------------------
	#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	# [System.Collections.ArrayList].add()  
	# give [9]
	#write-output $list_tot_trim
	#write-output $list_tot_trim.length
	#write-output $list_tot_trim.count
	#write-output $list_tot_trim[0].gettype()
	#write-output $list_tot_trim[4].gettype()
	#write-output $list_tot_trim[0]
	#write-output $list_tot_trim[0].count
	#write-output $list_tot_trim[2][0]
		
	#$list_tot_trim | foreach-object {write-output $_ $_.GetType()}
	#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	# -------------------------------------------------------------
	
	#	-	-	-	-	-	-	-	-
	#combined lists are trimed (empty lists are excluded)
	[System.Collections.ArrayList]$list_tot_mixed = @()
		
	for ($i=0; $i -lt $col_max; $i++)
		{
		$ext = [string]$i
		$oneDlist = 'list_mixed_' + $ext + '_'
		#$oneDlist
		$oneDlist =  [System.Collections.ArrayList]::new()
		#write-output $i
		#write-output $oneDlist		
		#write-output $list_tot_trim[$i]		
		
		for ($j=0; $j -lt  $row_count; $j++)
			{
			[void]$oneDlist.add($list_tot_trim[$j][$i] )
			#$list_tot_trim += $list_tot_trim[$j][$i]
			
			#write-output $j
			#write-output $list_tot_trim[$j][$i]
			}
		[void]$list_tot_mixed.add($oneDlist)
		}
			
	
	# Testing the results of mixed array (mixed values of data in each row) 
	# -----------------------------
	#write-output "list_tot_mixed"
	#write-output $list_tot_mixed
	#write-output $list_tot_mixed.count
	#write-output $list_tot_mixed.length
	#write-output $list_tot_mixed
	#write-output $list_tot_mixed[0]
	#write-output $list_tot_mixed[0].count
	#write-output $list_tot_mixed[2][1]
	#write-output $list_tot_mixed[2][1].gettype()
	#write-output $list_tot_mixed[2][1].count
	#write-output $list_tot_mixed[2][1].length

	<#
	for ($i=0; $i -lt $list_tot_mixed.count; $i++)
		{
		write-host $list_tot_mixed[$i]
		}
	#>
	# -----------------------------------------
	
	return $list_tot_mixed
	}


# for testing the sunction
#------------------------------ 
#make-matrix
#$list_tot_mixed = make-matrix

# Testing the results of mixed array (mixed values of data in each row) 
# -----------------------------
#write-output "list_tot_mixed"
#write-output $list_tot_mixed
#write-output $list_tot_mixed.count
#write-output $list_tot_mixed.length
#write-output $list_tot_mixed[10]
#write-output $list_tot_mixed[2]
#write-output $list_tot_mixed[2].count
#write-output $list_tot_mixed[2][0]
#write-output $list_tot_mixed[2][1]
#write-output $list_tot_mixed[2][2]
#write-output $list_tot_mixed[2][1].gettype()
# ----------------------------------------------
#
<#
# makeing the HashTable an object:
$Object_from_table = [pscustomobject]$list_tot_mixed
write-host $Object_from_table

$csv_path = "temp_test_csv_1.csv"
$Object_from_table |export-csv  -path $csv_path
invoke-item -path $csv_path
#>
