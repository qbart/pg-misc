# pg-miscs
Miscellaneous stuff for PostgreSQL like custom functions, aggregates etc.

## Interval

```sql
SELECT seconds('1 day'::interval);  --> 86400::bigint 
```

## Timestamp

```sql
SELECT now_utc();  --> '2019-05-11 19:52:33.840088'::timestamp without time zone
```
