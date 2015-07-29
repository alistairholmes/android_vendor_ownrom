for combo in $(cat vendor/ownrom/own-device-targets)
do
    add_lunch_combo ownrom_$combo-userdebug
done
