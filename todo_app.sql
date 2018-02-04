DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

\c todo_app;

CREATE TABLE tasks (
  id            SERIAL        NOT NULL, 
  title         VARCHAR(255)  NOT NULL,
  description   TEXT          NULL,
  created_at    TIMESTAMP     NOT NULL   DEFAULT  now(),
  updated_at    TIMESTAMP     NULL,
  completed     BOOLEAN       NOT NULL   DEFAULT  false,
  PRIMARY KEY(id)
);

ALTER TABLE tasks

DROP COLUMN completed,
ADD COLUMN completed_at TIMESTAMP NULL DEFAULT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks VALUES(default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
  VALUES('Study PostgreSQL', 'Read all the documentation');

SELECT 
  title
FROM
  tasks WHERE completed_at is NULL;

UPDATE tasks
  SET completed_at = now()
WHERE title = 'Study SQL';

SELECT
  title, description
FROM
  tasks WHERE completed_at is NULL;

SELECT
  *
FROM 
  tasks 
ORDER BY
  created_at DESC;

INSERT INTO tasks (title, description)
  VALUES('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
  VALUES('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
  VALUES('third mistake', 'another test entry');

SELECT
  title
FROM
  tasks WHERE title ~ 'mistake';

DELETE FROM 
  tasks
WHERE title = 'mistake 1';

SELECT
  title, description
FROM
  tasks WHERE title ~ 'mistake';

DELETE FROM
  tasks
WHERE title ~ 'mistake';

SELECT
  *
FROM 
  tasks 
ORDER BY
  title;




  





