# Script de délégation de controle Active Directory
# Pour l'utilisateur VMware Instant-Clone
# https://vdihub.fr

# Renseigner OU bureaux virtuels Horizon entre ""
$OU = "OU=vdi,DC=dom,DC=local"

# Renseigner utilisateur Instant-Clone entre ""
$ICuser = "DOM\user"

# Effacement des erreurs précédentes
$Error.Clear()

# Créer / supprimer les objets ordinateurs (Create Delete Computer Objects)
dsacls "$OU" /G ""$ICuser":CCDC;Computer" /I:T

# Ecrire toutes les propriétes (Read All Properties)
dsacls "$OU" /G ""$ICuser":WP;;Computer" /I:S

# Lire toutes les propriétes (Write All Properties)
dsacls "$OU" /G ""$ICuser":RP;;Computer" /I:S

 # Lister le contenu (List Contents)
dsacls "$OU" /G ""$ICuser":LC;;Computer" /I:S

# Lire les permissions (Read Permissions)
dsacls "$OU" /G ""$ICuser":RC;;Computer" /I:S 

# Réinitialiser le mot de passe (Reset Password)
dsacls "$OU" /G ""$ICuser":CA;Reset Password;Computer" /I:S

# Rapport
$Error
Write-Host ""
Write-Host "User configuré : $ICuser" -ForegroundColor darkblue -BackgroundColor white
Write-host "OU configurée : $OU" -ForegroundColor darkblue -BackgroundColor white