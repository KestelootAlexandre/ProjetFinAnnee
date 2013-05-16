    <!-- Division pour le sommaire -->
    <div id="menuGauche">
     <div id="infosUtil">
    
        <h2>
    
</h2>
    
      </div>  
        <ul id="menuList">
			<li >
				 <?php
                              
                              $login=$_SESSION['prenom'];
                              $mdp=$_SESSION['nom'];
							  $idProfil=$_SESSION['idProfil'];
                              
                              
                             if($idProfil==1)
                             {
                                 echo'comptable :<br>';
                                 echo $_SESSION['prenom']."  ".$_SESSION['nom'] ;
                             }
                             else
                             {
                                 echo'visiteur :<br>';
                                 echo $_SESSION['prenom']."  ".$_SESSION['nom'] ;
                                 
                             }
		             
                             ?>
			</li>
           <li class="smenu">
              <a href="index.php?uc=gererFrais&action=saisirFrais" title="Saisie fiche de frais ">Saisie fiche de frais</a>
           </li>
		   </li>
           <li class="smenu">
              <a href="index.php?uc=gererFrais&action=saisirFraisHorsForfait" title="Saisie fiche de frais ">Saisie fiche de frais hors forfait</a>
              
           </li>
           <li class="smenu">
              <a href="index.php?uc=etatFrais&action=selectionnerMois" title="Consultation de mes fiches de frais">Mes fiches de frais</a>
           </li>
 	   <li class="smenu">
              <a href="index.php?uc=connexion&action=deconnexion" title="Se déconnecter">Déconnexion</a>
           </li>
         </ul>
        
    </div>
    