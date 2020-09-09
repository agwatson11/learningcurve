SELECT uk.postcode, uk.area, uk.effective, import.`Postcode`, import.`area`, import.`effectivefrom` FROM uk 
LEFT JOIN IMPORT ON uk.postcode = import.`Postcode` WHERE effectiveFrom IS NOT NULL;

UPDATE uk LEFT JOIN IMPORT ON import.postcode = uk.postcode
SET uk.area = import.area, uk.effective = import.effectivefrom
WHERE effectiveFrom IS NOT NULL;;