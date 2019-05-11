-- convert interval to seconds ()
-- up
CREATE OR REPLACE FUNCTION seconds(i interval) RETURNS BIGINT
AS
$$
BEGIN
  RETURN EXTRACT(EPOCH FROM date_trunc('second', i))::BIGINT;
END;
$$
IMMUTABLE
STRICT
LANGUAGE plpgsql;

-- down
DROP FUNCTION seconds(interval);
----------
