-- Control file for Oracle SQL Loader
-- Generated by (c) Ispirer SQLWays 9.0 Build 6197 64bit Licensed to bgtu - Nikita - Belarus - Ispirer MnMTK 2020 Microsoft SQL Server to Oracle Database Migration Demo License (1 month, 20200629)
-- Timestamp: Fri May 29 12:39:37 2020

OPTIONS(direct=false)
LOAD DATA
INFILE 'tablemigr.txt'
INTO TABLE TableMigr
INSERT
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' TRAILING NULLCOLS
(Col1,
 Col2)
