################## creating new custom group ################################

echo -e "[all:vars] \nansible_user=root \nansible_ssh_private_key_file=/sshconfig/keys/sshkey \nansible_sudo_pass=none" >> inventory.ini

################# creating docker container & inventory file##########################

docker-compose up -d &&
docker inspect --format '{{range .NetworkSettings.Networks }}{{.IPAddress}}{{end}}' $(docker ps -q) >> inventory.ini

########################## pin module for adhoc command ################################
ansible -i inventory.ini all -m ping
