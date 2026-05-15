
-- CREATED  A DUPLICATE TABLE TO DO OPERATIONS

CREATE TABLE amazon_cleaning.raw_prdoucts(
   ` Product Description` VARCHAR(500),
    `Price(Dollar)`  VARCHAR(500),
    `Number of  reviews` VARCHAR(20),
    `Real Price`  VARCHAR(500),
    `Free days` VARCHAR(100),
    `Shipment` VARCHAR(50),
    `Delivery Date` VARCHAR(30)
);

INSERT INTO `amazon_cleaning`.`raw_prdoucts`
(` Product Description`,
`Price(Dollar)`,
`Number of  reviews`,
`Real Price`,
`Free days`,
`Shipment`,
`Delivery Date`)
SELECT *
FROM amazon_cleaning.amazon_audio_video;

SELECT * 
FROM `amazon_cleaning`.`raw_prdoucts`;

ALTER TABLE amazon_cleaning.`raw_prdoucts`
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- DELETEING DUPICATE DATA
DELETE
FROM  amazon_cleaning.`raw_prdoucts`
WHERE ` Product Description` = 'Product Description' ;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE ` Product Description` = 'C2G' AND 
(`Number of  reviews` = '1' AND 
`Real Price` = 'None' AND 
`Shipment` = 'Ships to Bangladesh' AND
 `Price(Dollar)` =   '9' AND 
 `Number of  reviews` = '1' )
 ;
 DELETE 
 FROM amazon_cleaning.`raw_prdoucts`
 WHERE ` Product Description` = 'C2G' AND 
(`Number of  reviews` = '1' AND 
`Real Price` = 'None' AND 
`Shipment` = 'Ships to Bangladesh' AND
 `Price(Dollar)` =   '9' AND 
 (`Number of  reviews` = '1' AND
  `Delivery Date` IS NULL OR `Delivery Date` = ''))
 ;
 
DELETE 
FROM amazon_cleaning.`raw_prdoucts`
WHERE id = 1781
;

-- IDENTIFY BLANK VALUES

SELECT COUNT(*)
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Delivery Date` = '';

UPDATE amazon_cleaning.`raw_prdoucts`
SET `Delivery Date` = NULL
WHERE `Delivery Date` = '';

SELECT COUNT(`Shipment`)
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Shipment` = 'Ships to Bangladesh';


-- “Shipment column was removed because 95% of rows contained identical values and 
-- remaining values were inconsistent promotional/noisy text, providing low analytical value.”

ALTER TABLE amazon_cleaning.`raw_prdoucts`
DROP  `Shipment` ;

SELECT COUNT(*)
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Free days`= '90 days FREE. Terms apply.';


SELECT DISTINCT `Free days`
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Free days`!= '90 days FREE. Terms apply.';

SELECT `Free days`
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Free days` NOT LIKE '%days%';

-- “Values inconsistent with the dominant free-period pattern were replaced with 
-- NULL because they represented unrelated promotional or malformed text and 
-- reduced semantic consistency of the column.”

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Free days` = NULL
WHERE `Free days` NOT LIKE '%days%';

SELECT DISTINCT `Delivery Date`
FROM amazon_cleaning.`raw_prdoucts`;

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Delivery Date` = NULL
WHERE `Delivery Date` LIKE 'Ships to Bangladesh';

SELECT COUNT(*)
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` LIKE 'Ships to Bangladesh';

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` LIKE '90 days FREE. Terms apply.';

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Delivery Date` = NULL
WHERE `Delivery Date` LIKE 'Ships to Bangladesh';

-- “During data inspection, inconsistencies were identified between the free_days and delivery_date columns. 
-- Several rows contained delivery-related information inside the free_days column while the corresponding delivery_date field was NULL. 
-- This indicated column misalignment likely caused during dataset scraping or CSV parsing. 
-- Relevant delivery-related values were reassigned to the delivery_date column when the original field contained NULL values,
--  improving semantic consistency and reducing misplaced information.”

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Free days` = '90 days FREE. Terms apply.'
WHERE `Delivery Date` LIKE '90 days FREE. Terms apply.';

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Delivery Date` = NULL
WHERE `Delivery Date` LIKE '90 days FREE. Terms apply.';

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` LIKE '%Up%';


UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Delivery Date` = NULL
WHERE `Delivery Date` LIKE '%Up%';

SELECT  COUNT(`Delivery Date`)
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` != '%Jun%' OR `Delivery Date` != '%Jul%' ;

SELECT DISTINCT `Delivery Date`
FROM amazon_cleaning.`raw_prdoucts`;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` LIKE '%Microphone%';

-- “A small number of rows were identified with severe structural corruption caused by improper CSV parsing, where product description text overflowed into unrelated columns. 
-- Since reliable reconstruction was not possible, these rows were removed to preserve schema consistency and analytical reliability.”

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE id = 2443 AND `Number of  reviews` = ' FM Radio' AND `Price(Dollar)` = ' 1” Tweeter' ;

DELETE
FROM amazon_cleaning.`raw_prdoucts`
WHERE id = 2443 AND `Number of  reviews` = ' FM Radio' AND `Price(Dollar)` = ' 1” Tweeter' ;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` = ' Camping"';

DELETE
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` = ' Camping"' AND id = 1101;


SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` = ' Black""';

DELETE
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` = ' Camping"' AND id = 1101;

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Real Price` = '46'
WHERE `Delivery Date` = '46' ;

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Real Price` = '191' 
WHERE `Delivery Date` = '191';
 
UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Real Price` = '77' 
WHERE `Delivery Date` = '77' ; 

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Real Price` = '79.99'
WHERE `Delivery Date` = '79.99' ;

SELECT * 
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Delivery Date` = '46' OR 
`Delivery Date` = '191' OR 
`Delivery Date` = '77' OR 
`Delivery Date` = '79.99' OR 
`Delivery Date` = 'None' ;

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Delivery Date` = NULL
WHERE `Delivery Date` = '46' OR 
`Delivery Date` = '191' OR 
`Delivery Date` = '77' OR 
`Delivery Date` = '79.99' OR 
`Delivery Date` = 'None' ;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE  ` Product Description` LIKE 'Naxa%' AND `Delivery Date` = ' Black""'
;

-- “A small number of malformed records were identified where multiline product descriptions were incorrectly parsed into separate rows during 
-- CSV import, resulting in incomplete records with missing attribute values. These rows were removed during data cleaning.”

DELETE 
FROM amazon_cleaning.`raw_prdoucts`
WHERE  ` Product Description` LIKE 'Naxa%' AND `Delivery Date` = ' Black""'
;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE  ` Product Description` LIKE 'Naxa%' AND `Delivery Date` LIKE  '%3.5mm Input%'
;


DELETE 
FROM amazon_cleaning.`raw_prdoucts`
WHERE  ` Product Description` LIKE 'Naxa%' AND `Delivery Date` LIKE  '%3.5mm Input%'
;

SELECT DISTINCT  `Real Price`
FROM amazon_cleaning.`raw_prdoucts`;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Real Price` = ' Audiobooks"';

DELETE 
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Real Price` = ' Audiobooks"';

UPDATE amazon_cleaning.`raw_prdoucts`
SET  `Real Price` = 'NULL'
WHERE `Real Price` =  NULL ;

ALTER TABLE amazon_cleaning.`raw_prdoucts`
MODIFY `Real Price` FLOAT;

SELECT COUNT(*)
FROM amazon_cleaning.`raw_prdoucts`
WHERE  `Real Price` = NULL;

UPDATE amazon_cleaning.`raw_prdoucts`
SET `Real Price` = NULL
WHERE `Real Price` = 'NULL';

UPDATE amazon_cleaning.`raw_prdoucts`
SET `Real Price` = REPLACE(`Real Price`, ',', '');

ALTER TABLE amazon_cleaning.`raw_prdoucts`
MODIFY `Real Price` DECIMAL(10,4);

SELECT DISTINCT `Number of  reviews`
FROM amazon_cleaning.`raw_prdoucts`
;

SELECT * 
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Number of  reviews` = ' 6.5"""';

DELETE 
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Number of  reviews` = ' 6.5"""';


SELECT 
    c.index_id,
    c.`Number of reviews` AS cleaned_value,
    o.`Number of reviews` AS original_value
FROM cleaned_table c
JOIN original_table o
ON c.index_id = o.index_id
LIMIT 20;

SELECT 
    c.` Product Description`,
    c.`Price(Dollar)`,
    c.`Number of  reviews` AS cleaned_value,
    o.`Number of  reviews` AS original_value
FROM  `amazon_cleaning`.`raw_prdoucts` c
JOIN  `amazon_cleaning`.`amazon_audio_video` o
ON c.` Product Description` = o.` Product Description`
AND c.`Price(Dollar)` = o.`Price(Dollar)`;

DESCRIBE `amazon_cleaning`.`amazon_audio_video` ;



SELECT *
FROM amazon_cleaning.reliable_rows;

SELECT ` Product Description`,`Price(Dollar)`,
`Number of  reviews`
FROM `amazon_cleaning`.`raw_prdoucts`
LIMIT 20 ;

SELECT ` Product Description`,`Price(Dollar)`,
`Number of  reviews`
FROM amazon_cleaning.reliable_rows
WHERE ` Product Description` = 'Car Charger, 150W 2-Socket Cigarette Lighter Splitter QC 3.0 Dual USB Ports 1 USB C Fast Car Adapter with Separate Switch LED Voltmeter Replaceable 15A Fuse for GPS/Dash Cam/Phone/iPad'
AND `Price(Dollar)` = '18';

UPDATE `amazon_cleaning`.`raw_prdoucts`
SET `Number of  reviews` = '5,628'
WHERE ` Product Description` = 'Car Charger, 150W 2-Socket Cigarette Lighter Splitter QC 3.0 Dual USB Ports 1 USB C Fast Car Adapter with Separate Switch LED Voltmeter Replaceable 15A Fuse for GPS/Dash Cam/Phone/iPad'
AND `Price(Dollar)` = '18';

WITH CTE_EXAMPLE AS
(
SELECT  ` Product Description`,`Price(Dollar)`,
`Number of  reviews`
FROM amazon_cleaning.reliable_rows 
),
CTE_EXAMPLE_2 AS (
SELECT  ` Product Description`,`Price(Dollar)`,
`Number of  reviews`
FROM amazon_cleaning.`raw_prdoucts`
)
SELECT B.` Product Description`,B.`Price(Dollar)`,B.`Number of  reviews`
FROM CTE_EXAMPLE_2 A
LEFT JOIN CTE_EXAMPLE B
ON A.` Product Description` = B.` Product Description`
AND A.`Price(Dollar)` = B.`Price(Dollar)`;

CREATE TABLE amazon_cleaning.matched_products AS
WITH CTE_EXAMPLE AS (
    SELECT ` Product Description`, `Price(Dollar)`, `Number of  reviews`
    FROM amazon_cleaning.reliable_rows
),
CTE_EXAMPLE_2 AS (
    SELECT ` Product Description`, `Price(Dollar)`, `Number of  reviews`
    FROM amazon_cleaning.raw_prdoucts
)
SELECT 
    B.` Product Description`,
    B.`Price(Dollar)`,
    B.`Number of  reviews`
FROM CTE_EXAMPLE_2 A
LEFT JOIN CTE_EXAMPLE B
ON A.` Product Description` = B.` Product Description`
AND A.`Price(Dollar)` = B.`Price(Dollar)`;

SELECT *
FROM amazon_cleaning.matched_products;



CREATE TABLE  amazon_cleaning.raw_products_staging AS
SELECT * FROM `amazon_cleaning`.`raw_prdoucts`;

SELECT *
FROM amazon_cleaning.raw_products_staging;


UPDATE amazon_cleaning.raw_prdoucts r
JOIN amazon_cleaning.matched_products m
ON r.` Product Description` = m.` Product Description`
AND r.`Price(Dollar)` = m.`Price(Dollar)`
SET r.`Number of  reviews` = m.`Number of  reviews`;

SELECT `Number of  reviews`
FROM  amazon_cleaning.raw_prdoucts 
WHERE `Number of  reviews` LIKE '%.%';

SELECT *
FROM amazon_cleaning.raw_prdoucts 
WHERE `Number of  reviews` = '39.9900';

SELECT *
FROM amazon_cleaning.raw_prdoucts 
WHERE ` Product Description` ='Arkon Sticky Suction Windshield or Dash Car Mounting Pedestal for Arkon Smartphone and Tablet Holders' AND 
`Price(Dollar)` = '17';

SELECT *
FROM amazon_cleaning.amazon_audio_video
WHERE ` Product Description` = 'Coleman CBTL20 Portable Waterproof Bluetooth Speaker w/Campsite Lighting & Portable Charger' AND 
`Price(Dollar)` = '59';

UPDATE  amazon_cleaning.raw_prdoucts
SET  `Number of  reviews` = '22'
WHERE ` Product Description` = 'Arkon Sticky Suction Windshield or Dash Car Mounting Pedestal for Arkon Smartphone and Tablet Holders' AND 
`Price(Dollar)` = '17'  AND  `Real Price` IS NULL;

SELECT DISTINCT `Number of  reviews`
FROM amazon_cleaning.raw_prdoucts ;

WITH CTE_EXAMPLE AS
(
SELECT  ` Product Description`,`Price(Dollar)`,
`Number of  reviews`
FROM amazon_cleaning.reliable_rows 
),
CTE_EXAMPLE_2 AS (
SELECT  ` Product Description`,`Price(Dollar)`,
`Number of  reviews`
FROM amazon_cleaning.`raw_prdoucts`
)
SELECT *
FROM CTE_EXAMPLE A
LEFT JOIN CTE_EXAMPLE_2 B
ON A.` Product Description` = B.` Product Description`
AND A.`Price(Dollar)` = B.`Price(Dollar)`
WHERE A.`Number of  reviews` != B.`Number of  reviews` ;

UPDATE amazon_cleaning.`raw_prdoucts`
SET `Number of  reviews` = REPLACE(`Number of  reviews`, ',', '');

ALTER TABLE amazon_cleaning.`raw_prdoucts`
MODIFY `Number of  reviews` INTEGER;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`;

SELECT DISTINCT `Price(Dollar)`
FROM amazon_cleaning.`raw_prdoucts`;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Price(Dollar)` ='Gray"';

UPDATE amazon_cleaning.`raw_prdoucts`
SET `Price(Dollar)` = null
WHERE `Price(Dollar)` = 'Gray"';

UPDATE amazon_cleaning.`raw_prdoucts`
SET `Price(Dollar)`  = REPLACE(`Price(Dollar)` , ',', '');

ALTER TABLE amazon_cleaning.`raw_prdoucts`
MODIFY `Price(Dollar)` INTEGER;

-- “The product_description column was preserved without major modification because the values were structurally consistent and 
-- contained important business information such as brand names, model identifiers, technical specifications, and product features. 
-- Excessive cleaning was avoided to prevent loss of semantic meaning and searchable product metadata.”

SELECT *
FROM amazon_cleaning.`raw_prdoucts` 
WHERE `Price(Dollar)` > `Real Price`;

SELECT  MAX(`Real Price`) 
FROM amazon_cleaning.`raw_prdoucts` ;

SELECT ` Product Description`
FROM amazon_cleaning.`raw_prdoucts` 
WHERE `Real Price` = '2994.0100';

SELECT  MAX(`Number of  reviews`) 
FROM amazon_cleaning.`raw_prdoucts` ;

SELECT *
FROM amazon_cleaning.`raw_prdoucts`
WHERE `Price(Dollar)` IS NULL OR
`Number of  reviews` IS NULL OR
`Real Price` IS NULL or
`Free days` IS NULL OR
`Delivery Date` IS NULL ;

SELECT *
FROM amazon_cleaning.`amazon_audio_video`
WHERE `Price(Dollar)` IS NULL OR
`Number of  reviews` IS NULL OR
`Real Price` IS NULL or
`Free days` IS NULL OR
`Delivery Date` IS NULL ;