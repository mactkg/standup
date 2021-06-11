SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJ_DIR=$(realpath $SCRIPT_DIR/../)
INSTALL_DIR=/opt/mctk-standup

echo "Copy files"
sudo install -d -o $USER $INSTALL_DIR/bin/
sudo install -d -o $USER $INSTALL_DIR/log/
sudo install $PROJ_DIR/standup.sh $INSTALL_DIR/bin/standup.sh

echo "Set Token"
if [ -e $PROJ_DIR/token ]; then 
    echo "Token found. Use project token"
    token=`cat $PROJ_DIR/token`
else 
    read -p "token: " token
fi
cp $PROJ_DIR/Library/LaunchAgents/net.makerbox.standup.plist /tmp/net.makerbox.standup.plist
sed -i -e "s/ADD_TOKEN_HERE/$token/" /tmp/net.makerbox.standup.plist
sudo install -o $USER /tmp/net.makerbox.standup.plist $HOME/Library/LaunchAgents/net.makerbox.standup.plist
rm /tmp/net.makerbox.standup.plist

echo "Load Standup"
launchctl unload $HOME/Library/LaunchAgents/net.makerbox.standup.plist
launchctl load $HOME/Library/LaunchAgents/net.makerbox.standup.plist