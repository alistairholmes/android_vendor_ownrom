#! /bin/bash
if [ -e ".repo" ]
then
. build/ownrom.sh > /dev/null
dir=$ANDROID_BUILD_TOP
tools=$dir/vendor/ownrom/tools
. $tools/colors
echo -e "$bldred Syncing OwnROM repositories......"
$normal
for repository in $(cat $tools/ownrom-repos)
do
cd $repository
git reset --hard HEAD
cd $dir
echo -e "$bldblu Syncing $repository"
echo -e "$bldcya `repo sync $repository`"
echo -e "$bldgrn Synced $repository"
echo -e ""
done
$normal
else
echo -e "Please make sure you are running this in the root of your build directory"
exit;
fi




