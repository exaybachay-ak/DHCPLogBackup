#Get info about yesterday
$dateinfo = (Get-Date).AddDays(-1)
$year = $dateinfo.year
$month = $dateinfo.month
$day = $dateinfo.day
$dayname = Get-Date -uformat %A
$daynametruncated = ""
$firstthree = 0..2 | %{
	$daynametruncated += $dayname[$_]
}
$hour = $dateinfo.hour

#set up a filename for backup log files
$v4logname = "$year-$month-$day-DHCPv4Log.log"
$v6logname = "$year-$month-$day-DHCPv6Log.log"

#copy yesterdays logs into backup folder
#  -don't want today's logs since they won't be complete
copy "C:\windows\system32\dhcp\DhcpSrvLog-$daynametruncated.log" "C:\windows\system32\dhcp\backup\$v4logname"
copy "C:\windows\system32\dhcp\DhcpV6SrvLog-$daynametruncated.log" "C:\windows\system32\dhcp\backup\$v6logname"
