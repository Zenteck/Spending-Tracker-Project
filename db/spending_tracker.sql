DROP TABLE transanctions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  merchant_id INT REFERENCES merchants(id),
  -- ON DELETE CASCADE,
  tag_id INT REFERENCES tags(id),
  -- ON DELETE CASCADE,
  amount DECIMAL(18, 2),
  epoch BIGINT
);
