-- returns counts per key in single jsonb
-- up
CREATE FUNCTION jsonb_count__transition(state jsonb, key anyelement) RETURNS jsonb
AS
$$
BEGIN
  RETURN jsonb_set(
    state,
    ARRAY[key]::varchar[],
    (COALESCE((state->>(key::varchar))::numeric, 0) + 1)::varchar::jsonb
  );
END;
$$
IMMUTABLE
STRICT
LANGUAGE plpgsql;


CREATE AGGREGATE jsonb_count(anyelement)
(
    sfunc = jsonb_count__transition,
    stype = jsonb,
    initcond = '{}'
);


-- down
DROP AGGREGATE jsonb_count(anyelement);
DROP FUNCTION jsonb_count__transition(jsonb, anyelement);
----------
