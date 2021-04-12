CREATE TABLE admin(
    id BIGINT GENERATED ALWAYS AS  IDENTITY,
    name varchar,
    password varchar,
    PRIMARY KEY(id)
)