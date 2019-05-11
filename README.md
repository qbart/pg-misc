# pg-miscs
Miscellaneous stuff for PostgreSQL like custom functions, aggregates etc.

## Interval

```sql
SELECT seconds('1 day'::interval) --> 86400::bigint 
```
