BEGIN;

-- DROP TABLES --

DROP TABLE IF EXISTS "users", "recipes", "categories", "recipe_has_category";

-- CREATE TABLES --

CREATE TABLE "users" (
  "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "username" TEXT NULL,
  "email" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "role" TEXT NOT NULL DEFAULT 'user',
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NULL
);

CREATE TABLE "categories" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" TEXT NOT NULL DEFAULT '',
  "image" TEXT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "recipes" (
  "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "title" TEXT NOT NULL,
  "image" TEXT NULL,
  "body" TEXT NOT NULL,
  "link" TEXT NOT NULL,
  "user_id" INTEGER NOT NULL REFERENCES "users"("id"),
  "category_id" INTEGER NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NULL
);

CREATE TABLE "recipe_has_category" (
  "recipe_id" INTEGER NOT NULL REFERENCES "recipes"("id") ON DELETE CASCADE,
  "category_id" INTEGER NOT NULL REFERENCES "categories"("id") ON DELETE CASCADE,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("recipe_id", "category_id")
);

-- POPULATE TABLES --

INSERT INTO "users" ("username", "email", "password")
VALUES ('alios17', 'alios@me.com', 'alios17');

INSERT INTO "categories" ("name", "image")
VALUES
  ('Italian', 'https://www.giallozafferano.com/images/228-22819/Spaghetti-Carbonara-Bacon-and-egg-spaghetti_1200x800.jpg'),
  ('Vegetarian', 'https://www.feastingathome.com/wp-content/uploads/2022/02/Mushroom-Risotto_-17-683x1024.jpg'),
  ('Salad', 'https://media-cdn2.greatbritishchefs.com/media/1y1fbz4k/img27439.whqc_1426x713q80fpt480fpl650.webp'),
  ('Asian', 'https://hot-thai-kitchen.com/wp-content/uploads/2021/04/jungle-curry-blog-1.jpg'),
  ('Barbecue', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Big-John-s-Chili-Rubbed-Ribs_EXPS_SFBZ23_119906_P2_MD_11_17_2b.jpg?resize=700,700'),
  ('Traditional', 'https://media-cdn2.greatbritishchefs.com/media/mdhlgvfa/img10614.whqc_768x512q80fpt343fpl593.webp'),
  ('Healthy', 'https://img.jamieoliver.com/jamieoliver/recipe-database/89080985.jpg?tr=w-800,h-600'),
  ('Comfort Food', 'https://www.seriouseats.com/thmb/ZYr0KaBpOLEMMyg8AN00OwdNeXs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20220201-tartiflette-vicky-wasik-33-1387b0975ce0466d86c83ea6a8f75cd9.jpg'),
  ('Mexican', 'https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-carnitas-recipe.jpg');

INSERT INTO "recipes" ("title", "image", "body", "link", "user_id", "category_id")
VALUES
  ('Creamy White Chicken Chili',
  'https://www.halfbakedharvest.com/wp-content/uploads/2021/11/Creamy-White-Chicken-Chili-7.jpg',
  'This simple one pot Creamy White Chicken Chili is the perfect bowl to warm up to on a cold fall/winter day. Made with poblano peppers, jalapeños (for just the right amount of heat), and shredded chicken. It’s spicy, creamy and so delicious. Top each bowl of chili with plenty of cheddar cheese, fresh cilantro, and avocado too.',
  'https://www.halfbakedharvest.com/creamy-white-chicken-chili/',
  1,
  1);

ALTER TABLE "recipes"
ADD FOREIGN KEY ("category_id") REFERENCES "categories"("id");

-- CREATE INDEXES IF NEEDED --

-- CREATE UNIQUE INDEX IF NEEDED --

COMMIT;
