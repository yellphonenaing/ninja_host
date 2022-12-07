trap 'bye;' 2
setdir () {
read -p $'\e[1;35mEnter Your Web Folder Path :: \e[0m' dirpath
if [[ -e "path" ]];then
rm path
else
echo ""
fi
echo $dirpath >path
echo -e "\e[1;31mYour Web Folder Was Set To $dirpath\e[0m"
sleep 2
dirsetting
}
Chdir () {
read -p $'\e[1;35mEnter Your Web Folder Path :: \e[0m' dirpath
if [[ -e "path" ]];then
rm path
else
echo ""
fi
echo $dirpath >path
echo -e "\e[1;31mYour Web Folder Was Chsnged To $dirpath\e[0m"
sleep 2
dirsetting
}
dirsetting () {
banner
echo -e "\e[1;31m           Web Folder Setting\e[0m"
if [[ -e "path" ]];then
echo -e "\e[1;33mYou Set Web Folder,You Can Change It.\e[0m" 
echo -e "\e[1;33mYour Web Folder Path is $(cat path)
\e[0m" 
else
echo -e "\e[1;33mWeb Folder Is Not Set,So You Need To Set It.\e[0m"
fi
echo -e "\e[1;33m
	(1) Set Web Folder
	(2) Change Web Folder
	(3) Back To Previous Menu
\e[0m"
read -p $'\e[1;35mEnter Your Choice :: \e[0m' dirch
case $dirch in
1)
setdir;;
2)
Chdir;;
3)
Settings;;
*)
dirsetting;;
esac
}
updatauser () {
mysqld_safe > /dev/null 2>&1 & sleep 2
MYSQL=`which mysql`
Q1="ALTER USER 'ninjahost'@'localhost' IDENTIFIED BY '$npass';"
Q2="GRANT ALL ON *.* TO 'ninjahost'@'localhost' IDENTIFIED BY '$npass';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
$MYSQL -e "$SQL"
killall -9 mysqld_safe mariadbd
echo -e "\e[1;31mDatabase User Have Been Created.\e[0m"
sleep 2
main
}
createuser () {
mysqld_safe > /dev/null 2>&1 & sleep 2
MYSQL=`which mysql`
Q1="CREATE DATABASE IF NOT EXISTS ninjahost;"
Q2="GRANT ALL ON *.* TO 'ninjahost'@'localhost' IDENTIFIED BY 'poweredbyypn';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
$MYSQL -e "$SQL"
killall -9 mysqld_safe mariadbd
echo -e "\e[1;31mDatabase User Have Been Created.\e[0m"
sleep 2
menu
}
chps () {
read -p $'\e[1;35mEnter New Password :: \e[0m' npass
mysqld_safe > /dev/null 2>&1 & sleep 2
updatauser
killall -9 mysqld_safe mariadbd
echo "Username:ninjahost
Password:$npass" >database
echo -e "\e[1;31mYour Database User's Password Have Been Changed To $npass\e[0m"
sleep 2
dbsetting
}
dbsetting () {
banner
echo -e "\e[1;31m           Database Setting\e[0m"
if [[ -e "database" ]];then
echo -e "\e[1;33mYour User Account Have Been Created,You Can Change It.\e[0m" 
echo -e "\e[1;33m
$(grep -o 'Username:.*' database | cut -d " " -f2)
$(grep -o 'Password:.*' database | cut -d " " -f2)
\e[0m" 
else
echo "Username:ninjahost
Password:poweredbyypn" >database
createuser
dbsetting
fi
echo -e "\e[1;33m
	(1) Change Password
	(2) Back To Previous Menu
\e[0m"
read -p $'\e[1;35mEnter Your Choice :: \e[0m' dbch
case $dbch in
1)
chps;;
2)
Settings;;
*)
dbsetting;;
esac
}

Chtoken () {
read -p $'\e[1;35mEnter Ngrok AuthToken :: \e[0m' token
ngrok authtoken $token > /dev/null 2>&1 & sleep 2
echo -e "\e[1;33mNgrok Authtoken Have Been Changed.\e[0m"
sleep 2
ngsetting
}
settoken () {
read -p $'\e[1;35mEnter Ngrok AuthToken :: \e[0m' token
ngrok authtoken $token > /dev/null 2>&1 & sleep 2
echo -e "\e[1;33mNgrok Authtoken Have Been Set.\e[0m"
sleep 2
ngsetting
}
ngsetting () {
banner
echo -e "\e[1;31m           Ngrok Setting\e[0m"
if [[ -e "$HOME/.ngrok2/ngrok.yml" ]];then
echo -e "\e[1;33mYou Set Ngrok AuthToken,You Can Change It.\e[0m" 
echo -e "\e[1;33mYour AuthToken -
$(cat $HOME/.ngrok2/ngrok.yml)
\e[0m" 
else
echo -e "\e[1;33mNgrok AuthToken Is Not Set,So You Need To Set It.\e[0m"
fi
echo -e "\e[1;33m
	(1) Set Ngrok AuthToken
	(2) Change Ngrok AuthToken
	(3) Back To Previous Menu
\e[0m"
read -p $'\e[1;35mEnter Your Choice :: \e[0m' ngch
case $ngch in
1)
settoken;;
2)
Chtoken;;
3)
Settings;;
*)
ngsetting;;
esac
}
ChP () {
read -p $'\e[1;35mEnter Port Number(Ex:8080,8000) :: \e[0m' por
echo -e "\e[1;31m           Port Setting\e[0m"
if [[ -e "port" ]];then
rm port
else
echo ""
fi
echo $por >port
echo -e "\e[1;33mPort Have Been Changed To $por.\e[0m"
sleep 2
psetting
}
setP () {
read -p $'\e[1;35mEnter Port Number(Ex:8080,8000) :: \e[0m' por
if [[ -e "port" ]];then
rm port
else
echo ""
fi
echo $por >port
echo -e "\e[1;33mPort Have Been Set To $por.\e[0m"
sleep 2
psetting
}
psetting () {
banner
echo -e "\e[1;31m           Port Setting\e[0m"
if [[ -e "port" ]];then
echo -e "\e[1;33mYou Set The Port As $(cat port),You Can Change It.\e[0m" 
else
echo -e "\e[1;33mPort Is Not Set,So You Need To Set It.\e[0m"
fi
echo -e "\e[1;33m
	(1) Set Port Number
	(2) Change Port Number
	(3) Back To Previous Menu
\e[0m"
read -p $'\e[1;35mEnter Your Choice :: \e[0m' pch
case $pch in
1)
setP;;
2)
ChP;;
3)
Settings;;
*)
psetting;;
esac
}
Install () {
echo -e "\e[1;33mInstalling And Setting Up Requirements\e[0m"
pkg install php
pkg install curl
pkg install mariadb
pkg install wget
echo -e "\e[1;33mDownloading Ngrok\e[0m"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
echo -e "\e[1;33mUnzipping Ngrok\e[0m"
unzip ngrok-stable-linux-arm.zip
echo -e "\e[1;33mSetting Up Ngrok\e[0m"
cp ngrok /$PREFIX/bin
nowdir=$(pwd)
cd /$PREFIX/bin
chmod +x *
cd $nowdir
echo -e "\e[1;33mCreating Database User\e[0m"
createuser
echo -e "\e[1;33mAll Requirement Are Installed And Set Up\e[0m"
sleep 3
menu
}
Settings () {
banner
echo -e "\e[1;33m
	(1) Port Setting
	(2) Ngrok Setting
	(3) Database Setting
	(4) Website Folder Setting
	(5) Back To Main Menu
\e[0m"
read -p $'\e[1;35mEnter Your Choice :: \e[0m' settingC
case $settingC in
1)
psetting;;
2)
ngsetting;;
3)
dbsetting;;
4)
dirsetting;;
5)
menu;;
*)
rcset;;
esac
}
Database () {
echo -e "\e[1;33mStarting Database Server\e[0m"
echo -e "\e[1;33mIf You Want To Stop Press CTRL + C \e[0m"
mysqld_safe > /dev/null 2>&1 & sleep 2
while [ true ];do
sleep 1
done
}
Ngrok () {
banner
echo -e "\e[1;32mForwarding Local Port $port With Ngrok\e[0m"
ngrok http $(cat port) > /dev/null 2>&1 &
		sleep 10
url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
echo -e "\e[1;33mWebsite Folder :: $(cat path)\e[0m"
echo -e "\e[1;33mYour Web Link: $url\e[0m"
echo -e "\e[1;33mIf You Want To Stop Press CTRL + C \e[0m"
while [ true ];do
sleep 1
done
}
bye () {
killall mysqld_safe mariadbd
banner
echo -e "\e[1;32mThanks For Using My Tool.{ Yell Phone Naing }
Bye Bye:) \e[0m"
exit
}
Localhost ()
{
command -v php || { echo >&2 "Please Install All Requirements";sleep 5;menu; }
banner
host=php
echo -e "\e[1;31mCreating Localhost On Port $(cat port) 
\e[1;33mWebsite Folder :: $(cat path)\e[0m
\e[1;33mIf You Want To Stop Press CTRL + C \e[0m"
php -S 127.0.0.1:$(cat port) -t $(cat path) > /dev/null 2>&1 & sleep 2
while [ true ];do
sleep 1
done
}
Startall () {
banner
echo -e "\e[1;33mStarting"
sleep 1
echo -e "Localhost Server On Port $(cat port)"
sleep 2
echo -e "Forwarding Port With Ngrok"
ngrok http $(cat port) > /dev/null 2>&1 &
		sleep 10
echo -e "Starting Database Server\e[0m"
mysqld_safe > /dev/null 2>&1 & sleep 2
url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z-]*\.ngrok.io")
echo -e "\e[1;33mWebsite Folder :: $(cat path)\e[0m"
echo -e "\e[1;33mYour Web Link: $url\e[0m"
echo -e "\e[1;33mIf You Want To Stop Press CTRL + C \e[0m"
php -S 127.0.0.1:$(cat port) -t $(cat path) > /dev/null 2>&1 & sleep 2
while [ true ];do
sleep 1
done
}
banner () {
clear
echo -e "\e[1;32m 
NN   NN iii           jjj            HH   HH  OOOOO   SSSSS  TTTTTTT 
NNN  NN     nn nnn          aa aa    HH   HH OO   OO SS        TTT   
NN N NN iii nnn  nn   jjj  aa aaa    HHHHHHH OO   OO  SSSSS    TTT   
NN  NNN iii nn   nn   jjj aa  aaa    HH   HH OO   OO      SS   TTT   
NN   NN iii nn   nn   jjj  aaa aa    HH   HH  OOOO0   SSSSS    TTT   
                    jjjj                                            

\e[1;35m       		{::}{Coder :: Yell Phone Naing}{::}

	{::}{ Github :: https://www.github.com/T-Tools }{::}
 \e[0m"
}
About () {
banner
echo -e "\e[1;33m
	Coder	  :: Yell Phone Naing

	Tool Name :: Ninja Host

	Github    :: https://www.github.com/T-Tools

	FaceBook  :: https://www.facebook.com/yellphoen.naing

	Purpose   :: To Build Mini WebServer
\e[0m"
sleep 5
menu
}
input () {
read -p $'\e[1;35mEnter Your Choice :: \e[0m' number
}
list () {
case $number in
1)
Localhost;;
2)
Ngrok;;
3)
Database;;
4)
Startall;;
5)
Settings;;
6)
Install;;
7)
About;;
8)
bye;;
*)
rechoose;;
esac
}
menu () {
banner
echo -e "\e[1;33m
	(1) Localhost
	(2) Ngrok
	(3) Database Server [ Mariadb ]
	(4) Start All At Once
	(5) Server Settings
	(6) Install Requirements
	(7) About Coder
	(8) Exit
\e[0m"
input
list
}
menu
trap 2
