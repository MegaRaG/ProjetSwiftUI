
Exercice 1 :
Q1 / Les éléments de la liste ne sont pas identifiables, il faut les différencier avec le self,

Exercice 2 :
Q1 /  il y a un ForEach qui a été ajouté.
Q2 /  Le ForEach est utilisé pour créer une vue répétée, il crée des vues `Text` pour chaque élément de votre tableau `loot`.
Le bouton "Ajouter" est séparé du `ForEach` pour montrer qu'il s'agit d'une action distincte et pas directement aux éléments de la liste.  Exercice 3 :
Le code ne marche pas car , l’appel a la fonction est mauvais (addLoot au lieu de addItem). Aussi car self est immuable.
Le @State permet de changer des valeurs dans une structure  donc l’ajouter règle le problème.

Questions 4-Ajouter un item :
	Exercice 1: 
Q1 / Il ne se passe rien au clique sur ajouter,  car il ne met pas a jour la liste
Q2 / Le Warning est qu’il y a plusieurs objets au même nom et seront donc difficile a retrouver.

	Exercice 2:
Q1 / Une fois ObservableObject,@Published et @ObservedObject dans le code la variable de l’iventaire se met a jour a chaque ajout.
 	
