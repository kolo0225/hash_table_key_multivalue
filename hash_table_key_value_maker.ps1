
# hash_table_key_value_maker.ps1
#
# Purpose:
# 	fn uses array & for loop
# 	generate key = value hashable
# 	Does that in many different ways 
# 	(choose one of all work)
#
# ============================================================ 

# function that MAKES HASH-TABLE
function array-loop ($list_key, $list_2d_value, $method)
	{
	
	$TableKeyList =[ordered] @{}
	Switch ($method) 
		{	
		'way0'
			{
			Write-host  'key = name' -backgroundcolor Red -foregroundcolor Black
			for ($i=0; $i -lt $list_key.count; $i++ )
				{
				$row = @{}
				$row = @{ $list_key[$i]= $list_2d_value[$i] }
				$TableKeyList = $TableKeyList + $row 
				}
			}
		'way1'
			{
			Write-host  '.add()' -backgroundcolor Red -foregroundcolor Black
			for ($i=0; $i -lt $list_key.count; $i++ )
				{
				$TableKeyList.add( $list_key[$i], $list_2d_value[$i])
				}
			}
		'way2'
			{
			Write-host  'HashTable[key] = value' -backgroundcolor Red -foregroundcolor Black
			for ($i=0; $i -lt $list_key.count; $i++ )
				{
				$TableKeyList[$list_key[$i]] = $list_2d_value[$i]
				}
			}
		'way3'
			{
			Write-host  'HashTable.key = value' -backgroundcolor Red -foregroundcolor Black
			for ($i=0; $i -lt $list_key.count; $i++ )
				{
				$TableKeyList.$list_key[$i] = $list_2d_value[$i]
				}
			}


		default {write-host 'there is no other way'}
		}	
	return $TableKeyList
	}

#. C:\Users\kolo0\Dropbox\Everything\Classes\my_notes\programming\cmd\ps_scripts\scrpt_cls\array_elem_position_comb.ps1 

# ============================================================ 
# for testing/troubleshooting
# --------------------------
#[system.collections.arraylist]$list_key = @('tasos','lisa','alex','ellie')
#[system.collections.arraylist]$list_2d_value = @((11, 12,13,14),(1, 2,3,4))
#$list_key
#$method = 'way1'
#array-loop  $list_key $list_2d_value $method
#$TableKeyList = array-loop  $list_key $list_2d_value $method
#write-host $TableKeyList
#$TableKeyList.keys
#$TableKeyList.values
