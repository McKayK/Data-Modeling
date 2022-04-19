CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "user_email" VARCHAR(50),
  "user_password" VARCHAR(50)
);

CREATE TABLE "recipes" (
  "recipe_id" SERIAL PRIMARY KEY,
  "recipe_name" VARCHAR(50),
  "ingredient_id" INT NOT NULL,
  "instructions" VARCHAR(2000),
  "public_or_private" BOOLEAN,
  "user_id" INT NOT NULL
);

CREATE TABLE "user_recipe" (
  "user_recipe_id" SERIAL PRIMARY KEY,
  "user_id" INT NOT NULL,
  "recipe_id" INT NOT NULL
);

CREATE TABLE "grocery_list" (
  "grocery_list_id" SERIAL PRIMARY KEY,
  "user_id" INT NOT NULL,
  "recipe_id" INT NOT NULL,
  "ingredient_id" INT NOT NULL
);

CREATE TABLE "occasions" (
  "occasion_id" SERIAL PRIMARY KEY,
  "occasion_name" VARCHAR(50),
  "user_id" INT NOT NULL,
  "recipe_id" INT NOT NULL
);

CREATE TABLE "ingredients" (
  "ingredient_id" SERIAL PRIMARY KEY,
  "ingredient_name" VARCHAR(20),
  "recipe_id" INT NOT NULL
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "recipes" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "user_recipe" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "user_recipe" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "grocery_list" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "grocery_list" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "grocery_list" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "occasions" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "occasions" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "ingredients" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");
