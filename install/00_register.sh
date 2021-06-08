token=`cat token`
http -v POST https://pixe.la/v1/users \
    token=$token \
    username=mactkg \
    agreeTermsOfService=yes \
    notMinor=yes
