token=`cat token`
http POST https://pixe.la/v1/users/mactkg/graphs \
    X-USER-TOKEN:$token \
    id=standup \
    name='standup)' \
    unit='time(s)' \
    type=int \
    color=shibafu \
    timezone='Asia/Tokyo'
