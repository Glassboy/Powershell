This is a series of scripts that are an alternative to using the Octopi Raspberry Pi image.

Step 1: Updates the packages and installs ansible

Step 2: Installs NFS server and the Cockpit Management tool

Step 3: Creates the octoprint users, installs Git and clones the Octoprint-deploy repo to the octoprint user's home directory.

log into the pi as the octoprint user for step 4.

Step 4: Install Octoprint with octoprint-deploy (without haproxy)

switch back to the pi root account

Step 5: Export the Octoprint watched folder and use IP Tables to port forward 80 to 5000.

switch back to the octoprint users

Step 6: Install plugins and restart the instance.