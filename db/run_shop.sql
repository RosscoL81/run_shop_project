DROP TABLE trainers;
DROP TABLE brands;

CREATE TABLE brands (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE trainers (
  id SERIAL8 primary key,
  trainer_name VARCHAR(255),
  description TEXT,
  quantity INT8,
  buy_cost INT8,
  sell_price INT8,
  brand_id INT8 REFERENCES brands(id)
);
