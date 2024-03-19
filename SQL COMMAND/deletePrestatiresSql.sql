-- Delete from referencing table (supprimerrequest)
DELETE FROM supprimerrequest
WHERE prestataire_pid IN (
    SELECT prestataire_pid
    FROM prestataire
    WHERE created_at < '2024-02-18'
);

-- Delete from referencing table (noterevaluation)
DELETE FROM noterevaluation
WHERE reevaluation_pid IN (
    SELECT persistenceid
    FROM reevaluation
    WHERE prestataire_pid IN (
        SELECT prestataire_pid
        FROM prestataire
        WHERE created_at < '2024-02-18'
    )
);

-- Delete from eferencing table (reevaluation)
DELETE FROM reevaluation
WHERE prestataire_pid IN (
    SELECT prestataire_pid
    FROM prestataire
    WHERE created_at < '2024-02-18'
);

-- Delete from referencing table (prestataire_telephones)
DELETE FROM prestataire_telephones
WHERE prestataire_persistenceid IN (
    SELECT prestataire_persistenceid
    FROM prestataire
    WHERE created_at < '2024-02-18'
);

-- Delete from referencing table (prestataire_adresses)
DELETE FROM prestataire_adresses
WHERE prestataire_persistenceid IN (
    SELECT prestataire_persistenceid
    FROM prestataire
    WHERE created_at < '2024-02-18'
);

-- Delete from the second referencing table (qualificationp)
DELETE FROM qualificationp
WHERE prestataire_pid IN (
    SELECT prestataire_pid
    FROM prestataire
    WHERE created_at < '2024-02-18'
);

-- Delete from the first referencing table (blacklistrequest)
DELETE FROM blacklistrequest
WHERE prestataire_pid IN (
    SELECT prestataire_pid
    FROM prestataire
    WHERE created_at < '2024-02-18'
);

-- Delete from the main table (prestataire)
DELETE FROM prestataire
WHERE created_at < '2024-02-18';

