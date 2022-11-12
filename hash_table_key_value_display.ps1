#
# hash_table_key_value_display.ps1
# Purpose:
# 	displays the values from 
# 	hash_table_key_value_maker.ps1
#
# ============================================================ 
 
function display-hashtable ($TableKeyList)
	{
		
	write-output "`n display the whole table"
	write-host $TableKeyList
	write-host $TableKeyList.keys
	write-host $TableKeyList.values
	$TableKeyList | Measure-Object
	#$TableKeyList.values | Measure-Object -Average
	$TableKeyList.length ; write-host " the length of the whole hash table"
	$TableKeyList.count ; write-host " the count of the whole hash table"

	write-output "`n display individual rows"
	$TableKeyList[$list_key[0], $list_key[1]]
	write-host "`n"
	$TableKeyList[$list_key[0]].length ; write-host " the length of a value row"
	write-host "`n"
	$TableKeyList[$list_key[0]].count ; write-host " the count of of a value row"
	write-host "`n- 1 row of values"
	$TableKeyList[$list_key[0]] | foreach-object {write-host $_ -backgroundcolor Cyan -foregroundcolor Black}
	#write-host "`n- 1 row of values splitted"
	#$TableKeyList[$list_key[0]] | foreach-object {$_ -split ' '; write-host $_ -backgroundcolor Cyan -foregroundcolor Black}


	# ----------------------------------------------------------------------------
	# this display values for a single value (key = value) hash tatble`
	write-output "`n loops through single value (key = value) hash table"

	# can't modify a hashtable while it's being enumerated
	$index=0
	$TableKeyList.keys | ForEach-Object {
		$message = 'key {0} value: {1}'  -f $_, $TableKeyList[$_][$index]
		Write-Output $message
		}

	write-output "`n loops through the table and type"

	$index=2
	# can't modify a hashtable while it's being enumerated
	$TableKeyList.GetEnumerator() | ForEach-Object {
		$message = 'key {0}  key_type: {1} 
			value: {2} value_type: {3} ' -f $_.key, $_.key.GetType(), $_.value[$index], $_.value[$index].GetType()
		Write-Output $message
		}
	# ----------------------------------------------------------------------------
	
	# this display values for a multivalue (key = @(value1, value2 ..)) hash tatble`
	write-output "`n loops through multivalue (key = @(value1, value2 ..)) hash tatble"

	for ($i=0; $i -lt $TableKeyList.count; $i++)
		{
		write-host "key = " $list_key[$i]
		#write-host $TableKeyList[$list_key[$i]]
		#write-host $TableKeyList[$i].key.gettype()
		for ($j=0; $j -lt $TableKeyList[$list_key[$i]].count; $j++)	
			{
			write-host "value = " $TableKeyList[$list_key[$i]][$j]
			write-host "value_type = " $TableKeyList[$list_key[$i]][$j].gettype()
			}

		}

	$json = $TableKeyList| ConvertTo-Json -Depth 2
	write-host $json -backgroundcolor Yellow -foregroundcolor Black

	}






