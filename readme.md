# MASSA scripts

Edit massa_vars.sh put your path to massa-client directory
```
cd $HOME/massa_scripts
cp template_massa_vars.sh massa_vars.sh

# Insert actual values
nano massa_vars.sh
```

## Setup Telegarm alert bot

```
cd $HOME/massa_scripts
cp template_tgbot_vars.sh tgbot_vars.sh

# Open and edit TG settings (put your bot API token and chat-ID of your TG profile)
nano tgbot_vars.sh
```

### Setup CRON

```
crontab -e
```
Add line for checking status every 15 minutes:
```
*/15 * * * * $HOME/massa_scripts/massa_rolls_notify.sh
```
Check cron logs
```
sudo grep CRON /var/log/syslog
or
sudo tail /var/log/syslog -f | grep CRON
```

