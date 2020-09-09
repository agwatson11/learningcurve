SELECT COUNT(postcode) FROM uk WHERE effective = '01/08/2020';
SELECT COUNT(postcode) FROM IMPORT WHERE effectivefrom = '01/08/2020';

UPDATE IMPORT SET Postcode = REPLACE(postcode,' ','');

SELECT import.postcode, import.area, import.EffectiveFrom, uk.postcode, uk.effective 
FROM IMPORT LEFT JOIN uk ON import.postcode = uk.postcode;

INSERT INTO UK (`postcode`,`area`,`effective`) 
SELECT import.postcode, import.area, import.EffectiveFrom FROM IMPORT
LEFT JOIN uk ON import.postcode = uk.postcode WHERE uk.postcode IS NULL;

