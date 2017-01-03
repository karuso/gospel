# LINUX

## Enabling and disabling services during startup
### CENTOS

- ADD
```bash
# chkconfig httpd --add
# chkconfig  httpd  on --level 2,3,5
```

- LIST
```bash
# chkconfig --list httpd
```

- DISABLE
```bash
# chkconfig httpd off
# chkconfig httpd --del
```

### UBUNTU

- ADD
```bash
# update-rc.d apache2 start 20 2 3 4 5 . stop 80 0 1 6 .
```

- DISABLE
```bash
# update-rc.d -f apache2 remove
```

## Redirecting to null

```bash
# script >> /dev/null 2>&1
```

## Remove ^M from file
```bash
for file in $(find /path/to/folder -type f); do
   tr -d '\r' <$file >temp.$$ && mv temp.$$ $file
done
```



Back to the [Table of Contents](https://github.com/karuso/gospel#table-of-contents)