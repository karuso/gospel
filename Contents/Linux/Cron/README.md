# CRON

Schedule a cron to execute at 2am daily.
This will be useful for scheduling database backup on daily basis.

```
0 2 * * * /bin/sh backup.sh
```

Schedule a cron to execute twice a day.
Below example command will execute at 5AM and 5PM daily. You can specify multiple time stamp by comma separated.

```
0 5,17 * * * /scripts/script.sh
```

Schedule a cron to execute on every minutes.
Generally we don’t require any script to execute on every minutes but in some case you may need to configure it.

```
* * * * *  /scripts/script.sh
```

Schedule a cron to execute on every Sunday at 5 PM.
This type of cron are useful for doing weekly tasks, like log rotation etc.

```
0 17 * * sun  /scripts/script.sh
```

Schedule a cron to execute on every 10 minutes.
If you want to run your script on 10 minutes interval, can configure like below. These type of crons are useful for monitoring.

```
*/10 * * * * /scripts/monitor.sh
*/10: means to on each 10 minutes. Same as if you want to execute on every 5 minutes use */5.
```

Schedule a cron to execute on selected months.
Some times we required to schedule a task to be executed for selected months only. Below example script will run on January, May and August months.

```
* * * jan,may,aug *  /script/script.sh
```

Schedule a cron to execute on selected days.
If you required to schedule a task to be executed for selected days only. Below example will run on each Sunday and Friday at 5PM .

```
0 17 * * sun,fri  /script/script.sh
```

Schedule a cron to execute on first sunday of every month.
To schedule a script to execute a script on first sunday only is not possible by time parameter, But we can use the condition in command fields to do it.

```
0 2 * * sun  [ $(date +%d) -le 07 ] && /script/script.sh
```

Schedule a cron to execute on every four hours.
If you want to run script on 4 hours interval. It can be configured like below.

```
0 */4 * * * /scripts/script.sh
```

Schedule a cron to execute twice on every Sunday and Monday.
To schedule a task to execute twice on Sunday and Monday only. Use following settings to do it.

```
0 4,17 * * sun,mon /scripts/script.sh
```

Schedule a cron to execute on every 30 Seconds.
To schedule a task to execute on every 30 seconds is not possible by time parameters, But it can be done by schedule same cron twice like below.

```
* * * * * /scripts/script.sh
* * * * *  sleep 30; /scripts/script.sh
```

Schedule a multiple tasks in single cron.
To configure multiple tasks with single cron, Can be done by separating tasks by semicolon ( ; ).

```
* * * * * /scripts/script.sh; /scripts/scrit2.sh
```

Schedule tasks to execute on specific moment.
It will execute task on first minute of every year, It may useful to send new year greetings 🙂
```
@yearly timestamp is similar to “0 0 1 1 *”.
@yearly /scripts/script.sh
```

It will execute task on first minute of month. It may useful to do monthly tasks like pay the bills and invoicing to customers.

```
@monthly timestamp is similar to “0 0 1 * *”.
@monthly /scripts/script.sh
```

It will execute task on first minute of month. It may useful to do weekly tasks like cleanup of system etc.

```
@weekly timestamp is similar to “0 0 1 * *”.
@weekly /bin/script.sh
```

It will execute task on first minute of every day, It may useful to do daily tasks.

```
@daily timestamp is similar to “0 0 * * *”.
@daily /scripts/script.sh
```

It will execute task on first minute of every hour, It may useful to do hourly tasks.

```
@hourly timestamp is similar to “0 * * * *”.
@hourly /scripts/script.sh
```

It is useful for those tasks which you want to run on your system startup. It will be same as system startup scripts. It is useful for starting tasks in background automatically.

```
@reboot
@reboot /scripts/script.sh
```

Back to the [Linux](/Contents/Linux)

Back to the [Table of Contents](/Contents)