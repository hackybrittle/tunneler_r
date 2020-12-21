# Tunneler

This script is used to create SSH tunnels and to keep them alive indefinitely. The script attached creates a tunnel from local(client) port 6100 to remote(server) MySQL port 3306. You can modify it based on your requirements.

Below are the steps to follow if you want to setup tunneler script to establish a persistent ssh tunnel from client to a server.


### Client Side (from server):

1. Create a user called tunneler_r, Do not provide any password (no login user)

		adduser tunneler_r

2. Create ssh keys using the command below, or your own method.

		ssh-keygen -f id_rsa_<clientname>

	>example:<br>
	>ssh-keygen -f id_rsa_clientname

	after running this command, private and public keys will be created. 

3. Copy the private key into the tunneler_r/.ssh folder.

		cp id_rsa_<clientname> /home/tunneler_r/.ssh/.

4. Create a config file

		cd /home/tunneler_r/.ssh/
		nano config

	and paste the following lines.

	>host &lt;server_hostname&gt;<br>
	>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;identityfile /home/tunneler_r/.ssh/id_rsa_&lt;clientname&gt;

	>example:<br>
	>host hostname.domain<br>
	>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;identityfile /home/tunneler_r/.ssh/id_rsa_&lt;clientname&gt;

	save and exit.

4. Create a folder called "log" into the tunneler_r account's home folder so that the script can store the logs.

5. Copy the tunneler_ssh.sh in directory of your choice.

6. Now add a crontab entry, using the command below

		sudo crontab -e

	and add the following line

	>*/5 * * * * sh /<path_to_the_tunneler_file_from_step_5>/tunneler_ssh.sh

### Server Side (to server):
Login to the server you want to create the tunnel to.
1. Repeat the step 1 from client side.

2. Copy the contents of the public key created earlier in client into tunneler's authrorized users file, using command

		 nano /home/tunneler_r/.ssh/authorized_users

	add the contents of the public key like below

	>from="hotname.x.y,IPv4,IPv6" <id_rsa_public_key_contents>
		
2. Allow the tunneler_r user to login in the sshd_config 
		nano /etc/ssh/sshd_config
	and add the following lines.
	>AllowUsers tunneler_r@client_dns_name

	>example:<br>
	>AllowUsers tunneler_r@hostname.domain

Done!

You have successfully created a persistent ssh connection between the client and the server.
