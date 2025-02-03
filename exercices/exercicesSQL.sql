-- Exercice 1 : Liste des rendez-vous planifiés
-- Objectif : Vérifier la relation entre `rendezvous`, `patients` et `utilisateurs`.
-- Afficher les informations des rendez-vous planifiés (état = 'planifié') avec le nom et prénom du patient et du médecin.

SELECT r.*, p.nom AS NomPatient, p.prenom AS PrenomPatient, u.prenom AS PenomMedecin,u.nom AS NomMedecin
FROM rendezvous r, patients p , utilisateurs u 
WHERE  r.patient_id = p.id
AND r.utilisateur_id = u.id 
AND u.role = 'medecin' 



-- Exercice 2 : Traitements en cours
-- Objectif : Vérifier la relation entre `traitements`, `patients` et `medicaments`.
-- Lister les traitements en cours, en incluant le nom du patient, le médicament, les doses, et la période.

SELECT p.nom AS NomPatient, p.prenom  AS PrenomPatient , m.nom ,t.*
FROM traitements t, medicaments m , patients p 
WHERE t.patient_id = p.id 
AND t.medicament_id  = m.id 



-- Exercice 3 : Stock des médicaments
-- Objectif : Vérifier si les informations de stock et d'expiration des médicaments sont correctement enregistrées.
-- Afficher les médicaments dont le stock est inférieur à 50    ou dont la date d'expiration est proche (moins de 90 jours).

SELECT * FROM medicaments m 
WHERE stock_disponible < 50
OR m.date_expiration < CURRENT_DATE() + INTERVAL 90 DAY

-- Exercice 4 : Historique des rendez-vous
-- Objectif : Vérifier que les états des rendez-vous sont bien enregistrés.
-- Afficher les rendez-vous effectués ou annulés, triés par date de création.

SELECT r.*
FROM rendezvous r 
WHERE etat = 'effectué' 
OR etat = 'planifié'
ORDER BY date_creation DESC;


-- Exercice 5 : Patients et leurs traitements
-- Objectif : Vérifier les correspondances entre les patients et leurs traitements.
-- Afficher pour chaque patient, les traitements qu'il suit actuellement, avec les recommandations associées.
SELECT p.nom AS PatientNom, p.prenom AS PatientPrenom , m.nom , t.duree_jours , t.dosage , t.recommandations , m.`dose_maximale_journalière` , m.dose_mortelle 
FROM patients p , traitements t, medicaments m 
WHERE p.id = t.patient_id 
AND t.medicament_id = m.id 




-- Exercice 6 : Médecins actifs
-- Objectif : Vérifier si les médecins ayant des rendez-vous assignés sont bien liés aux tables.
-- Afficher les médecins ayant des rendez-vous planifiés ou effectués, avec le nombre total de rendez-vous par médecin.

SELECT u.*, COUNT(r.id) AS nbRDV, r.etat 
FROM utilisateurs u
JOIN rendezvous r ON r.utilisateur_id = u.id
WHERE u.role = 'medecin'
AND (r.etat = 'planifié' OR r.etat = 'effectué')
GROUP BY u.id;


-- Exercice 7 : Rendez-vous par mois
-- Objectif : Vérifier les données temporelles.
-- Afficher le nombre de rendez-vous par mois pour chaque utilisateur.

SELECT u.id, u.nom, u.prenom, MONTH(r.date_creation) AS mois, COUNT(r.id) AS nbRDV
FROM utilisateurs u
JOIN rendezvous r ON r.utilisateur_id = u.id

-- Exercice 8 : Médicaments les plus prescrits
-- Objectif : Vérifier la fréquence d'utilisation des médicaments.
-- Lister les médicaments les plus prescrits, avec le nombre total de fois qu'ils apparaissent dans les traitements.


-- Exercice 9 : Durée moyenne des traitements
-- Objectif : Vérifier les statistiques sur les durées des traitements.
-- Calculer la durée moyenne des traitements pour chaque médicament.
SELECT AVG(t.duree_jours), m.nom, m.id 
FROM medicaments m , traitements t 
WHERE m.id = t.medicament_id 
GROUP BY m.id

-- Exercice 10 : Patients sans rendez-vous
-- Objectif : Vérifier les données orphelines.
-- Lister les patients n'ayant aucun rendez-vous enregistré dans la table `rendezvous`.


