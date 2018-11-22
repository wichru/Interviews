DROP TABLE sellers;
DROP TABLE items;

CREATE TABLE sellers (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  rating INTEGER
);

CREATE TABLE items (
  id INTEGER,
  name VARCHAR,
  seller_id INTEGER,
  FOREIGN KEY (seller_id) REFERENCES sellers(id)
);

INSERT INTO sellers(id, name, rating) VALUES (34, 'John', 4);
INSERT INTO sellers(id, name, rating) VALUES (39, 'Chloe', 2);
INSERT INTO sellers(id, name, rating) VALUES (52,'Marie', 5);
INSERT INTO sellers(id, name, rating) VALUES (122,'Suzy', 1);
INSERT INTO sellers(id, name, rating) VALUES (167,'Stephen', 5);

INSERT INTO items(id, name, seller_id) VALUES (261, 'Incredible Silk Chair', 52);
INSERT INTO items(id, name, seller_id) VALUES (262, 'Mediocre Marble Watch', 34);
INSERT INTO items(id, name, seller_id) VALUES (263, 'Durable Iron Knife', 167);
INSERT INTO items(id, name, seller_id) VALUES (264, 'Rustic Copper Pants', 39);
INSERT INTO items(id, name, seller_id) VALUES (265, 'Small Rubber Table', 34);
