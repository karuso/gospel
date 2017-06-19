# MySQL

- [Installation](#installation)
    - [CentOS](#centos)
    - [Secure Installation](#secure-installation)
- [Users Management](#users-management)
- [Stored Functions](#stored-functions)
- [Views](#views)
- [Triggers](#triggers)
- [Shortcuts](#shortcuts)
- [Common mysql prompt sequences](#common-mysql-prompt-sequences)
- [Useful Clients](#useful-clients)
- [Gotchas](#gotchas)
- [Other useful commands](#other-useful-commands)

## Installation

### CentOS
```
# yum install gcc mysql-devel python-devel openssl-devel
# pip install MySQL-python==1.2.5 (only for python scripts)
```

### Secure Installation
```
# mysql_secure_installation
    create root password
    disable root from outside localhost
    disable anonymous user
    delete test database
```

## Users Management

Creating a New User Account (and granting privileges)
```
mysql> GRANT <privileges> ON database_name.* TO jason@192.168.1.145 IDENTIFIED BY  password;
```

Deleting a User Account
```
mysql> REVOKE ALL PRIVILEGES FROM jason@192.168.1.145; (to revoke privileges)
mysql> DROP USER jason@192.168.1.145; (to actually delete the user)
```

Changing a Password
```
mysql> SET PASSWORD FOR jason@192.168.1.145 = PASSWORD(supersecret);
```

Granting Additional Privileges
```
mysql> GRANT DELETE ON dzone.* TO jason@192.168.1.145;
```

Revoking Privileges
```
mysql> REVOKE DELETE, UPDATE FROM jason@192.168.1.145;
```

Granting Table- and Column-specific Privileges
```
mysql>GRANT INSERT ON dzone.timesheets TO jason@192.168.1.145;
mysql>GRANT INSERT (hours), SELECT (hours) ON dzone.timesheets TO jason@192.168.1.145;
```

Renaming Users
```
mysql> RENAME USER jason@192.168.1.145 TO wjg@192.168.1.145;
```

## Stored Functions
Creating a Stored Function and Use it
```
mysql> DELIMITER $$
mysql> CREATE FUNCTION calculate_bonus
->(employee_id INTEGER) RETURNS DECIMAL(5,2)
->BEGIN
->DECLARE article_count INTEGER;
->DECLARE bonus DECIMAL(10,2);
->SELECT count(id) AS article_count FROM articles
->WHERE author_id = employee_id;
->SET bonus = article_count * 10;
->RETURN bonus;
->END;
->$$
mysql> DELIMITER ;

mysql> SELECT name, phone, calculate_bonus(id) FROM authors;
```

Altering a Stored Function
```
mysql> DELIMITER $$
mysql> ALTER FUNCTION calculate_bonus
->MODIFIED FUNCTION BODY...
->$$
mysql> DELIMITER $$
```

Deleting a Stored Function
```
mysql> DROP FUNCTION calculate_bonus;
```

## Views
Creating a View
```
mysql> CREATE VIEW author_view AS
->SELECT name, e-mail, phone FROM authors ORDER BY email ASC;

mysql> SELECT * FROM author_view;
```

Passing Query Parameters
```
mysql> SELECT * FROM author_view WHERE email =  jason@example.com ;
```

Viewing a View
```
mysql> DESCRIBE author_view; to examine the columns retrieved by the view

mysql> SHOW CREATE VIEW author_view; to view the view syntax
```

Modifying a View
```
mysql> ALTER VIEW author_view AS
->SELECT name, phone FROM authors ORDER BY phone;
```

## Triggers
Creating a Trigger
```
mysql> DELIMITER $$
mysql> CREATE TRIGGER article_counter
->AFTER INSERT ON articles
->FOR EACH ROW BEGIN
->UPDATE categories SET counter = counter + 1 WHERE id = NEW.category_id; ->END;
->$$
mysql> DELIMITER ;
```

Modifying a Trigger
You currently cannot modify an existing trigger from within the mysql client. Instead, you should delete the existing trigger and create it anew with the desired changes incorporated.

Deleting a Trigger
```
mysql> DROP TRIGGER pay_author;
```

## Shortcuts

Change root password
```
# mysqladmin -u root -p'old_password' password 'new_password'
```
Export to file (data only)
```
# mysqldump -u [user] -p[pass] --no-create-info mydb > mydb.sql
```
Export to file (structure only)
```
# mysqldump -u [user] -p[pass] --no-data mydb > mydb.sql
```
Import to database
```
# mysql -u [user] -p[pass] mydb < mydb.sql
```
Status
```
# mysqladmin -u root -p status
```

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

## Common mysql prompt sequences

```
`\c`  A counter that tracks the total number of issued session commands
`\d`  The current database
`\D`  The current date
`\h`  The server host
`\u`  Your username
`\U`  Your username@hostname
```

```
mysql> prompt mysql (\U - \d)>
mysql (root@localhost - database)>
```
## Useful Clients

```
my_print_defaults           Outputs the options defined in the my.cnf files.
myisamchk                   Aids in the review, repair, and optimization of MyISAM-defined tables.
myisamlog                   Displays the contents of MyISAM log files.
myisampack                  Compresses MyISAM tables, greatly enhancing the read performance.
mysql_config                Displays information regarding options you may find useful when compiling MySQL.
mysql_convert_table_format  Converts tables from one storage engine to another.
mysql_setpermission         A wrapper for setting MySQL user privileges.
mysqlaccess                 Aids in the review of user privileges.
mysqladmin                  Performs a wide array of administrative tasks pertinent to server operation.
mysqlcheck                  A unified wrapper for CHECK TABLE, REPAIR TABLE, ANALYZE TABLE, OPTIMIZE TABLE.
mysqlimport                 A wrapper for the LOAD DATA INFILE SQL statement.
mysqlshow                   A wrapper useful for learning more about database schemas.
mysqlslap                   Tests MySQL's performance by placing an artificial load on the server
                            and reporting the results.
perror                      The perror client helps to clarify the often cryptic system error numbers
```

```
myisam_ftdump           Displays information regarding any defined FULLTEXT indexes found in MyISAM
mysqlbinlog             Used for examining the contents of MySQL's binary log.
mysql_fix_extensions    Converts MyISAM table extensions to a standard format.
```

## Gotchas

It's not a bug - it's a gotcha. A "gotcha" is a feature or function which works as advertised - but not as expected.

[MySQL Gotchas](http://sql-info.de/mysql/gotchas.html)


## Other useful commands

Change table character set
```
mysql> ALTER TABLE tbl_name CONVERT TO CHARACTER SET utf8;
```


Back to the [Table of Contents](https://github.com/karuso/gospel#table-of-contents)

