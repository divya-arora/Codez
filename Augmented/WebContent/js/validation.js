function checkEmpty(data)
{
	if(data.length==0)
	{
	
	return false;
	}
	return true;
}

function checkLength(info,num)
{
	if(info.length>num || info.length<num)
		{
return false;
}
	else if(!isNumber(info))
		{
		return false;
		}
	return true;
}
function isNumber (o) {
	  return ! isNaN (o-0) && o !== null && o !== "" && o !== false;
	}

function checkGender(gender)
{
	var i,flag=0;
	for(i=0;i<gender.length;i++)
		{
		  if(gender[i].checked)
			  {
			  flag=1;
			  }
		}
	if(flag==0)
		{
		return false;
		}
	return true;
	}
