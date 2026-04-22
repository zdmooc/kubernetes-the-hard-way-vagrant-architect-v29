# V18 — Gap Analysis between repository and fully built local platform

## Ce que V18 ferme
- binaires ;
- kubeconfigs ;
- LB ;
- runtime ;
- CNI pédagogique ;
- séquence de build.

## Ce qui peut encore nécessiter adaptation
- ressources VirtualBox locales ;
- plugin `vagrant-scp` ;
- certificats réellement compatibles avec les IP/DNS retenus ;
- choix d’un vrai CNI multi-nœuds si l’objectif dépasse le lab pédagogique.
