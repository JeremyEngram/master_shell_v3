# Clean the current directory, deleting all but the 5 most recently touched files
./cleaner.sh

# Delete logs in the /var/log directory older than 30 days (dry-run mode, preview actions)
./cleaner.sh -d /var/log -D 30 -n

# Delete all files in /home/myUser directory containing "test" except the most recent
./cleaner.sh -s test -m 1 -d /home/myUser
