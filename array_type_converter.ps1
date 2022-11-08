
# array_type_converter.ps1
# -----------------

function convert-array ($array_in, $type)
	{
	switch ($type)	
		{
			'int'
			{
			[system.collections.arraylist]$array_out = $array_in| foreach-object {[int]$_}
			}

			'single'
			{
			[system.collections.arraylist]$array_out = $array_in| foreach-object {[single]$_}
			}
			'DateTime'
			{
			[system.collections.arraylist]$array_out = $array_in| foreach-object {[DateTime]$_}
			}
		}
	return $array_out
	}
