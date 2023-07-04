# Decouverte des handlers 

## installatioin et modification des configurations d'un serveur apache2 sur une machine ubuntu 

### module utilisé : apt , service , copy

>> le module apt ici va nous permettre d'installer apache2 dans nos machines distantes
>> le module service va nous permettre de s'assurer que le service tourne 
>> le module copy nous permet de copier des fichiers de la machine locale vers la machine distante 

## c'est quoi les handlers 

> les handlers sont des taches qui s'executent uniquement lorsqu'elles sont actionnés par une autre tache 
> dans notre cas ils vont nous permettre de redemarrer le service apache2 à chaque fois que les fichiers de configurations subissent des changements 
> #notify : <nom_du_handler>  permet d'actionner le handler lorqu'une tache se solde avec success 