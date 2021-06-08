user=mactkg
graph=standup
http=`which http`

if [ -z "$1" ]; then 
    token=`cat token`
else 
    token=$1
fi

terminal-notifier -title standup \
    -message "Standup Time!" \
    -execute "$http PUT https://pixe.la/v1/users/$user/graphs/$graph/increment X-USER-TOKEN:$token"