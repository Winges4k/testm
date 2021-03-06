#! /bin/bash

check_status(){
e=$(cat id.txt)
until [[ "$status" == "true" ]] || [[ "$e" -gt "999999" ]]
do
	((e=$e+1))
	sleep 1
	status=$(curl -s -4 --max-time 5 "https://apis.v-saas.com:9501/member/api/viewAuthorization?contentId=2&memberId=${e}&menuId=3&platform=5&imei=c959b475-f846-4a86-8e9b-508048372407" | python -m json.tool 2> /dev/null | grep authorization | awk '{print $2}' | cut -f1 -d",")
		

done
}
check_status

echo $e > id.txt
