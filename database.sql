CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "cpf" text,
  "order_id" int,
  "created_at" timestamp DEFAULT (now()),
  "update_at" timestamp DEFAULT (now())
);

CREATE TABLE "agencies" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "description" text,
  "star" int,
  "address_id" int
);

CREATE TABLE "addresses" (
  "id" SERIAL PRIMARY KEY,
  "address" text,
  "number" int,
  "zip_code" text,
  "city" text,
  "uf" text
);

CREATE TABLE "models" (
  "id" SERIAL PRIMARY KEY,
  "brand" text,
  "model" text,
  "year" int,
  "fuel" text
);

CREATE TABLE "cars" (
  "id" SERIAL PRIMARY KEY,
  "color" text,
  "board" text,
  "created_at" timestamp DEFAULT (now()),
  "model_id" int
);

CREATE TABLE "order_car" (
  "id" SERIAL PRIMARY KEY,
  "order_id" int,
  "car_id" int
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "agency_id" int,
  "customer_id" int,
  "cost" int,
  "hours" int,
  "order_date" timestamp
);

ALTER TABLE "agencies" ADD FOREIGN KEY ("address_id") REFERENCES "addresses" ("id");

ALTER TABLE "cars" ADD FOREIGN KEY ("model_id") REFERENCES "models" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("agency_id") REFERENCES "agencies" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "order_car" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_car" ADD FOREIGN KEY ("car_id") REFERENCES "cars" ("id");
