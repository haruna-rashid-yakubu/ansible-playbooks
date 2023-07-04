# Ansible Roles exercice

## exercice goals  

 1. Create ansible playbook 
 2. Create  `configuration` role in `roles` folder directory  that will be use to configure apache2 webserver
 3. Create  `deployment` role in `roles` folder directory  that will be use to deploy our website to  apache2 webserver
 4. Create an inventory of the servers to configure          

## Create ansible playbook 
### specs: 
The ansible playbook will contain only `one play` wich execute the role deployment 
in that play you will ensure that all the tasks below will be executed 

## Configuration role 
### specs:  

The configuration role will help us to install and configure apache2 web-server where we can : 
  

 1. change the `port` of apache web server  by setting up `apache_port` variable 
 2. change the `root-directory` of apache2  by setting up `apache_dir` variable 
 
 ### file structure:  \
 ├── defaults \
│   └── main.yml # all default variables \
├── files \
│   └── 000-default.conf \
├── handlers \
│   └── main.yml \
├── README.md \
├── tasks \
│   └── main.yml \
├── templates \
│   ├── 000-default.conf.j2 \
│   └── ports.conf.j2 \
└── vars \
    └── main.yml \
### Note : the role may detect and reload our webserver only when changes are made

## Deployment role 
### specs:  

The Deployment role will help us to Only deploy our site to the Webserver using the website jinja2 template : 
 the `index.html` could provide informations such as the `hostname` , `home-directory` , sshuser and `server IP` by exploiting `ansible-facts`
 ### file structure:  \
 ├── defaults\
│   └── main.yml\ 
├── handlers\ 
│   └── main.yml\ 
├── meta\ 
│   └── main.yml\
├── README.md\ 
├── tasks\ 
│   └── main.yml\
├── templates\ 
│   ├── index.html.j2\
│   └── styles.css.j2\
├── tests\
│   ├── inventory\
│   └── test.yml\ 
└── vars\
    └── main.yml
    
  The Dockerfile simplify provisionning of `ssh-server` by using `docker containers` and it uses the `marwaney/ssh-server` image


suite de l'exercice :
- suite sur le templating avec les `boucles for `
- templating avec des condition `if else` 
- adding ip-utils `iputils-ping` to deps
- creating `/etc/hosts` file wich will contain the dns record of all servers by using `for loop` 


  <!-- # roles:
  #   - deployment
  tasks: 
    - name: debug 
      ansible.builtin.debug:
        var: hostvars[groups.containeurs[1]].ansible_host

  #   - name: getting the lenght 
  #     ansible.builtin.debug:
  #       var: groups.containeurs | length -->