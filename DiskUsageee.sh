MaximumUsage=75

DiskUsage=$(df -h | grep "C:" | awk '{ print $6 }' | tr '%' ' ')

if [[ $DiskUsage -gt $MaximumUsage ]] then
   echo "WATCHOUT! Disk usage has exceeded $MaximumUsage% , Current Usage : $DiskUsage% , Date : $(date)"
else
   echo "Disk usage is : $DiskUsage% , Date : $(date)"
fi 