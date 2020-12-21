# Tunneler

This Ansible script is used to create SSH tunnels and to keep them alive indefinitely. You can modify it based on your requirements.


Below are the steps to follow if you want to setup tunneler script to establish a persistent ssh tunnel from client to a server.

### Prerequisites:

1. A running instance of Ansible.
2. SSH access to the hosts where the tunnel is created (to/from hosts).
3. If you are creating a tunnel from localhost then ssh access to the localhost. (Note: If you are running from MacOS please enable remote access in the System Preferences-> Sharing-> Enable Remote Login)


### To run the Ansible script:

1. cd into the repository directory

2. Use the following Ansible command

		ansible-playbook tunneler_r.yml -i hosts

3. Answer the prompts, you will need the following information  

    >From server/host: The machine from which you want to create the tunnel from.<br>From port: The port number from which you want to create the tunnel.<br>From user: The username with the ssh access to the from server.

    >To server/host: The machine to which you want to create the tunnel to.<br>To port: The port number to which you want to create the tunnel.<br>To user: The username with the ssh access to the to server.

    >Log Level: Required log level

    >Superuser pw: both for from and to hosts

4. Logging options

    Please make sure you you have enough disk space for loggging<br>Logs are stored in ~tunneler_r/logs/<br>
    0 - Disable Logging<br>
    1 - Log only ssh connection establish events<br>
    2 - Log all events

Done!

You have successfully created a persistent ssh connection between the client and the server.

