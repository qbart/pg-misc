# pg-miscs
Miscellaneous stuff for PostgreSQL like custom functions, aggregates etc.

## interval

```sql
SELECT seconds('1 day'::interval); 
```
| bigint |
| - | 
| 86400 |


## timestamp

```sql
SELECT now_utc();  
```
| timestamp without time zone |
| - | 
| 2019-05-11 19:52:33.840088 |


## jsonb

```sql
SELECT
  tags.group_id,
  jsonb_count(tags.val)
FROM (
	VALUES
		(1, 'a'),
		(1, 'a'),
		(1, 'b'),
		(1, 'c'),
		(2, 'a'),
		(2, 'b'),
		(2, null)
	) AS tags(group_id, val)
GROUP BY tags.group_id;
```
| integer | jsonb |
| - | - |
| 1 | {"a": 2, "b": 1, "c": 1} |
| 2 | {"a": 1, "b": 1} |
