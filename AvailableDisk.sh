TotalSpace=$(systeminfo | grep 'Total Physical Memory' | awk '{ print $4 }' | tr -d ',')
AvailableSpace=$(systeminfo | grep 'Available Physical Memory' | awk '{ print $4 }' | tr -d ',')
UsedSpace=$((TotalSpace - AvailableSpace))
Percentt=$(((UsedSpace*100)/TotalSpace))
MaximumUsage=60
if [[ $Percentt -gt $MaximumUsage ]] then
   echo "WATCHOUT! Memory consumption is very high , Current Consumption : $Percentt% , Date : $(date)" >> Demo.log
else
   echo "Memory consumption is average : $Percentt% , Date : $(date)" >> Demo.log
fi 