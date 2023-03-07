
/* STOP -

   WAIT -

   This SQL will delete your `sum` table and re-create it again
   with correct meta-data per DXCC entity, but NULL for the counts.

   You will need to run `update` after running this in order to have
   data per band poplated in `sum` table.
*/


/* This is the SQL that needs to be run in order to create the
   table `sum`.  It is to be run ONCE.  

   However, if you need to nuke the `sum` table, go ahead -- it won't
   affect any HTML generated.  
*/


/*
   How to run this SQL:

   $ mysql OPTIONS < setup_sum.sql
*/



DROP TABLE sum IF EXISTS;
CREATE TABLE sum
(
   id INT AUTO_INCREMENT,
   name VARCHAR(150),
   cqz INT,
   ituz INT,
   continent VARCHAR(4),
   pfx VARCHAR(16),
   dxid INT,
   m160 INT,
   m80 INT,
   m40 INT,
   m30 INT,
   m20 INT,
   m17 INT,
   m15 INT,
   m12 INT,
   m10 INT,
   m6  INT,
   m2  INT,
   cm70 INT,
   cm23 INT,
   PRIMARY KEY(id)
);

INSERT INTO sum
(name, cqz, ituz, continent, pfx, dxid)
SELECT d.name, d.cqz, d.ituz, d.continent, d.pfx, d.dxid
FROM dxcc d;


/* 
   Summary: 

   All that happens from doing this is building a table `sum` that is
   aware of all of the DXCC entities and their meta-data, but the
   sums of worked DXCC per band is NULL.  That's OK.  The `update`
   script re-sets the counts in the fields per band.
*/

