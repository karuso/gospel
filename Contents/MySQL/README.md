# MySQL

## Installation

CENTOS

    # yum install gcc mysql-devel python-devel openssl-devel
    # pip install MySQL-python==1.2.5



## Shortcuts

Change root password

    # mysqladmin -u root -p'old_password' password 'new_password'

Export to file (data only)

    # mysqldump -u [user] -p[pass] --no-create-info mydb > mydb.sql

Export to file (structure only)

    # mysqldump -u [user] -p[pass] --no-data mydb > mydb.sql

Import to database

    # mysql -u [user] -p[pass] mydb < mydb.sql

Status

    # mysqladmin -u root -p status


Copy table
```sql
CREATE TABLE new_table LIKE old_table;
INSERT new_table SELECT * FROM old_table;
```

Copy from table
```sql
INSERT table_1(col_1,col_2,...,col_n) SELECT col_x, col_y, col_z FROM table_2 [WHERE];
```

reset AUTO INCREMENT
```sql
ALTER TABLE table AUTO_INCREMENT=1;
```

Delete all tables
```sql
SET FOREIGN_KEY_CHECKS = 0;
SET @tables = NULL;
SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @tables
  FROM information_schema.tables
  WHERE table_schema = 'database_name'; -- specify DB name here.

SET @tables = CONCAT('DROP TABLE ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET FOREIGN_KEY_CHECKS = 1;
```

Delete all duplicate rows except for one
```sql
DELETE n1 FROM names n1, names n2 WHERE n1.id > n2.id AND n1.name = n2.name
```


# Gotchas

It's not a bug - it's a gotcha. A "gotcha" is a feature or function which works as advertised - but not as expected.

[MySQL Gotchas](http://sql-info.de/mysql/gotchas.html)

Back to the [Table of Contents](https://github.com/karuso/gospel#table-of-contents)