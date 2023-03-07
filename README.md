# 5bdxcc
Scripts to maintain DXCC worked tables

## Prerequisites

1. You are using logging software.
2. Your logging software is similar to Log4OM
3. The logging is stored in a MySQL database
4. Your logging software database schema holds the country name field as `country` and the DXCC ID number field as `dxcc`.  You can adjust the scripts (not your logging software schema) to make this match.


## Setup

1. In order to use this, you'll need to create a `dxcc` table.  The ARRL DXCC list is a list of entities and their corresponding numbers (DXCC ID) and other
data (CQ Zone, ITU Zone and so on).
2. This repository gives you the DXCC table.  In the `setup/` directory find the script to run (once) that will create the `dxcc` table.
3. Another *do once* operation is the creation of a table used to hold the counts per DXCC entity.  This table is called `sum`.  In the `setup/` directory find the script to run (once) that will create the `sum` table.
4. There is no need to recreate these tables.  There is also no harm done if you do.  But if you do recreate the `sum` table, you'll need to re-run the `update` script before running the `wanted` script.


## To Generate the 5BDXCC Table

Making the table of every entity worked per band is a two step process.

To re-create that HTML file, you'll run two scripts.

- [ ] The first is to run `update` to re-populate `sum` data.
- [ ] The second is to run `wanted` to generate the HTML.

The steps:

1.  In order to build the table, you'll need to generate a pivot-table
of the data that is in the `dxcc` table and your logging software table.  
Let's assume that it is a table `log` managed by your logging software (given
the prerequisites above).
2.  The `update` perl script extracts counts of QSOs per DXCC and stores
the counts in the `sum` table.   This is essentially creating the columns
in `sum` representing the aggregate counts in `log`.
3.  The next step is to run the script `wanted`.  All this does is
extract the data from `sum` and render it into HTML page.   You 
can tailor the HTML generation any way you see fit.

That's it.

## Schedule

So, there is no need to re-generate `sum` or HTML that often unless
you have worked some new DX.   If that happens just run two scripts:


```
$ perl update
$ perl wanted > worked.html
```

