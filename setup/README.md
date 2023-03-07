# Setup

The command to invoke here is `mysql` but I've omitted the arguments
that would be be needed to reach your database.

For example, if the MySQL database user is `joe`, password is `foo`
and database `mylog`

The command would look like this:

```
$ mysql -u joe -D mylog -p < setup_dxcc.sql
```
 
1. In MySQL, run the SQL as-is:

```
$ mysql OPTIONS < setup_dxcc.sql
```

2. In MySQL, run the SQL as-is: 

```
$ mysql OPTIONS < setup_sum.sql
```

## About DXCC

The SQL in this repository is the SQL dump from my `dxcc` table.

I hand wrote this table and modified it from the sources of data that
I found online.

I could have instead just given you the basic table, but the SQL script
above will literally create the `dxcc` table with all of the important
meta-data populated.  I added the DXCC ID number in the `dxid` field.



