# koprov

#Todo izio
##Knockout
Il faut d'abord créer un event server dans jobs qui permet de récuperer la liste des personnes connecté avec leur jobs correspondant (exemple : TriggerServerEvent("jobs:getonlinejob", job, intervention) [all : pour tout]qui return un TriggerClientEvent et lui dit s'il y en a. [intervention true ou false] si true, renvois que ceux qui ne sont pas en intervention sinon tout

ENSUITE : Il faut vérifier si le médecin n'est pas déjà en intervention id_intervention (0 : par defaut donc ne fait rien)

Si il n'y a pas de mec dispo, dommage, mettre un Radgoldtimer sinon attendre l'arrivé d'un médecin. Le médecin devra accepter la mission, sinon, on laisse le RadGold, ou sinon, on attend le médecin.
Si la mission est fini (300sec) le médecin à raté sa mission le joueur est repop hospital tout bien. Le médecin perd des points ?
Et sinon faut bien que le médecin soit en service (check skin)

Faut qu'il le ramène à l'hopital, le joueur doit payer 150$ de base pour le déplacement plus les frais.

Le médecin est alors plus en intervention.

##Mazone
Debug le programme, chat error message.
L'ajout dans la base de données est fini
Manque plus qu'a check si un point appartient ou non à a zone créer

##Jobs
Centraliser le système de job.
Je m'explique, à l'heure actuelle, toutes la gestion de job se fait dans le client, il trigger juste au serveur et récupère les infos coté client pour les traiter dans le client.
Une chose plus simple, plus manipulable serait dans un premier temps de faire du OOP coté server, avec tous les events qui traitent indépendament les différentes requetes
