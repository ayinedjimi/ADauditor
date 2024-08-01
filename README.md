# Remplacez <DOMAINNAME> par votre nom de domaine
.\myAudit.ps1 -ADNTHashes <DOMAINNAME>-hashes.txt -HashDictionary <FICHIER TEXTE HIBP>  | Fichier sortant <DOMAINNAME>-PasswordAudit.csv
# Exemple
.\myAudit.ps1 -ADNTHashes myDomain-hashes.txt -HashDictionary pwned-passwords-ntlm-ordered-by-count-v5.txt | Sortie de fichier myDomain-PasswordAudit.csv
Le résultat final sera un fichier CSV que vous pourrez importer dans excel et analyser.

Ayi NEDJIMI
