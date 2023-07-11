BEGIN;

-- DROP TABLES --

DROP TABLE IF EXISTS "user", "recipe", "category";


-- CREATE TABLES --
CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "username" TEXT NULL,
  "email" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "role" TEXT NOT NULL DEFAULT 'user',
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NULL
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL DEFAULT '',
  "image" TEXT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE "recipe" (
  "id" SERIAL PRIMARY KEY,
  "title" TEXT NOT NULL,
  "image" TEXT NULL,
  "body" TEXT NOT NULL,
  "link" TEXT NOT NULL,
  "website" TEXT NOT NULL,
  "user_id" INTEGER NOT NULL REFERENCES "user"("id"),
  "category_id" INTEGER NOT NULL REFERENCES "category"("id"),
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NULL
);


-- POPULATE TABLES --



INSERT INTO "user" ("username", "email", "password")
VALUES ('Alex T', 'alios@me.com', 'alios17');

INSERT INTO "category" ("name", "image")
VALUES
  ('Pasta', 'https://www.giallozafferano.com/images/228-22819/Spaghetti-Carbonara-Bacon-and-egg-spaghetti_1200x800.jpg'),
  ('Vegetarian', 'https://www.feastingathome.com/wp-content/uploads/2022/02/Mushroom-Risotto_-17-683x1024.jpg'),
  ('Salad', 'https://media-cdn2.greatbritishchefs.com/media/1y1fbz4k/img27439.whqc_1426x713q80fpt480fpl650.webp'),
  ('Asian', 'https://hot-thai-kitchen.com/wp-content/uploads/2021/04/jungle-curry-blog-1.jpg'),
  ('Barbecue', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Big-John-s-Chili-Rubbed-Ribs_EXPS_SFBZ23_119906_P2_MD_11_17_2b.jpg?resize=700,700'),
  ('Traditional', 'https://media-cdn2.greatbritishchefs.com/media/mdhlgvfa/img10614.whqc_768x512q80fpt343fpl593.webp'),
  ('Indian', 'https://media-cdn2.greatbritishchefs.com/media/qi0bw4or/img71955.whqc_768x512q80.webp'),
  ('Healthy', 'https://img.jamieoliver.com/jamieoliver/recipe-database/89080985.jpg?tr=w-800,h-600'),
  ('Mexican', 'https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-carnitas-recipe.jpg'),
  ('Fish & Seafood', 'https://media-cdn2.greatbritishchefs.com/media/pglec1se/img25262.whqc_768x512q80fpt488fpl506.webp'),
  ('Drinks & Cocktails', 'https://www.liquor.com/thmb/NtKmemhR70zK-UiAaxi2aO9Fgng=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__liquor__2018__05__08113350__bourbon-old-fashioned-720x720-recipe-ade6f7780c304999be3577e565c9bcdd.jpg'),
  ('Desserts', 'https://www.halfbakedharvest.com/wp-content/uploads/2023/03/Wholesome-Peanut-Butter-Pretzel-Chocolate-Chip-Cookies-1.jpg');


INSERT INTO "recipe" ("title", "image", "body", "link", "website", "user_id", "category_id")
VALUES
  ('Creamy White Chicken Chili',
  'https://www.halfbakedharvest.com/wp-content/uploads/2021/11/Creamy-White-Chicken-Chili-7.jpg',
  'This simple one pot Creamy White Chicken Chili is the perfect bowl to warm up to on a cold fall/winter day.',
  'https://www.halfbakedharvest.com/creamy-white-chicken-chili/',
  'halfbakedharvest.com',
  1,
  9
  ),
  ('Chicken Caesar salad',
  'https://media-cdn2.greatbritishchefs.com/media/ynebz3sr/img27438.whqc_768x512q80fpt422fpl588.webp',
  'Tom Aikens classic chicken Caesar salad recipe includes a recipe for making your own baguette, which isnt entirely necessary but will give it a touch of class. Leave out the chicken to make this recipe pescatarian.',
  'https://www.greatbritishchefs.com/recipes/chicken-caesar-salad-recipe',
  'greatbritishchefs.com',
  1,
  3
  ),
  ('Thai Jungle Curry with Chicken (Gaeng Pa Gai)',
  'https://hot-thai-kitchen.com/wp-content/uploads/2021/04/jungle-curry-blog-720x452.jpg',
  'This classic Thai dish is called "jungle curry" or gaeng pa because there are so many plants in it that it''s like a whole jungle in a bowl! Healthy, herbaceous, and fiercely spicy',
  'https://hot-thai-kitchen.com/jungle-curry/',
  'hot-thai-kitchen.com',
  1,
  4
  ),
  ('Tagliarini With Slow-cooked Tomato Sauce & Burrata',
  'https://mateo.kitchen/_next/image?url=https%3A%2F%2Fcms.mateo.kitchen%2Fwp-content%2Fuploads%2F9D05BFF1-9A8A-4EEA-AF01-8423B1FD8951-1280x1707.jpeg&w=1920&q=75',
  'If tomatoes are in season then it’s nice to use fresh ones, but in winter it’s best to avoid them and just use canned tomatoes instead.',
  'https://mateo.kitchen/recipes/tagliarini-with-slow-cooked-tomato-sauce-burrata',
  'mateo.kitchen',
  1,
  1
  ),
  ('One Pot Melty Burrata Lemon Pesto Pasta',
  'https://www.halfbakedharvest.com/wp-content/uploads/2021/07/One-Pot-Melty-Burrata-Lemon-Pesto-Pasta-3-700x1050.jpg',
  'Made with creamy melted burrata cheese, homemade pistachio basil, a touch of garlic, and finished with fresh basil and lemon',
  'https://www.halfbakedharvest.com/burrata-lemon-pesto-pasta/',
  'halfbakedharvest.com',
  1,
  1
  ),
  ('Spinach, lemon and garlic penne rigate with torn burrata',
  'https://media-cdn2.greatbritishchefs.com/media/5oih5nr1/img47775.whqc_768x512q80.webp',
  'Special but simple egg yolk, olive oil, lemon and garlic flavours come together to make a creamy and satisfying sauce while spinach, hazelnuts and burrata finish the dish beautifully.',
  'https://www.greatbritishchefs.com/recipes/spinach-pasta-with-burrata-recipe',
  'greatbritishchefs.com',
  1,
  1
  ),
  ('Super green spaghetti',
  'https://img.jamieoliver.com/jamieoliver/recipe-database/55846383.jpg?tr=w-800,h-1066',
  'This super speedy supper is a great way to transform hardy winter greens into a deliciously silky pasta sauce. So simple, but, boy, is it good.',
  'https://www.jamieoliver.com/recipes/pasta-recipes/super-green-spaghetti/',
  'jamieoliver.com',
  1,
  1
  ),
  ('Bolognese ragù',
  'https://media-cdn2.greatbritishchefs.com/media/eamlwefe/img60422.whqc_768x512q80fpt660fpl405.webp',
  'Learn how to make a classic Bolognese ragù, or Ragù alla Bolognese, with Filippo Trapella''s family recipe. Served with homemade tagliatelle, this ragù recipe is a quintessential dish of Emilia-Romagna.',
  'https://www.greatitalianchefs.com/recipes/bolognese-ragu-recipe',
  'greatitalianchefs.com',
  1,
  1
  ),
  ('Grilled Lobster with Bloody Mary Linguine | Gordon Ramsay',
  'https://homebakedfood.files.wordpress.com/2020/06/lobster-1.jpg',
  'A real special occasion dish - an amazing grilled lobster, with a side of Bloody Mary linguine.',
  'https://homebakedfood.wordpress.com/2020/05/31/gordon-ramsays-grilled-lobster-and-bloody-mary-pasta/2/',
  'homebakedfood.wordpress.com',
  1,
  1
  ),
  ('Mushroom & Leek Pasta With Garlic Bruschette',
  'https://kitchenjoyblog.com/wp-content/uploads/2020/04/mushroom-leek-pasta-gordon-ramsey-kitchen-joy-0652-768x1152.jpg',
  'A simple dish of pasta with a creamy mushroom sauce and fresh garlic bruschetta. Leeks are a fantastic ingredient - cheap and easy to work with and they give a subtle savoury flavour. ',
  'https://kitchenjoyblog.com/mushroom-and-leek-pasta/',
  'kitchenjoyblog.com',
  1,
  1
  ),
  ('Tuna pasta bake',
  'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-51616_12-796faab.jpg?quality=90&webp=true&resize=375,341',
  'Whip up this cheap treat using storecupboard ingredients, tinned tuna and sweetcorn',
  'https://www.bbcgoodfood.com/recipes/tuna-pasta-bake',
  'bbcgoodfood.com',
  1,
  1
  ),
  ('One Pot Stove-Top Pumpkin Mac and Cheese.',
  'https://www.halfbakedharvest.com/wp-content/uploads/2022/10/One-Pot-Stove-Top-Pumpkin-Mac-and-Cheese-1.jpg',
  'This super easy One Pot Stove-Top Pumpkin Mac and Cheese is the perfect recipe for sneaking in autumn vegetables.',
  'https://www.halfbakedharvest.com/one-pot-pumpkin-mac-and-cheese/',
  'halfbakedharvest.com',
  1,
  1
  ),
  ('Spaghetti alla carbonara',
  'https://media-cdn2.greatbritishchefs.com/media/rvnhhmyf/img59482.whqc_768x512q80.webp',
  'Spaghetti carbonara is perhaps the ultimate Italian fast food, perfect for a comforting midweek meal.',
  'https://www.greatitalianchefs.com/recipes/carbonara-recipe',
  'greatitalianchefs.com',
  1,
  1
  ),
  ('The Holiday - Christmas Fettuccine',
  'https://www.simplyscratch.com/wp-content/uploads/2017/12/Christmas-Fettucine-l-SimplyScratch.com-13-768x1151.jpg',
  'Super simple pasta dish consisting of finely minced shallots, garlic, white wine, cream and butter. Diced tomato and minced fresh parsley and torn basil give this fettuccine its red and green Christmas flair.',
  'https://www.simplyscratch.com/christmas-fettuccine/',
  'simplyscratch.com',
  1,
  1
  ),
  ('Pasta With Spicy ''Nduja-Tomato Sauce''',
  'https://www.seriouseats.com/thmb/W6wKq6vHjOU_0DBwtIHgBCIfTtg=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2020__02__20200114-nduja-pasta13-a30f0e7d0b174df0a177ac6d69e9568f.jpg',
  'This 30-minute dinner hits all the flavor sweet spots—salty, savory, and funky from the ''nduja and cheese, with sweet acidity from the tomatoes.',
  'https://www.seriouseats.com/spicy-nduja-tomato-sauce',
  'seriouseats.com',
  1,
  1
  ),
  ('Pasta alla sorrentina',
  'https://media-cdn2.greatbritishchefs.com/media/cvhbb04y/img77087.whqc_768x512q80.webp',
  'A simple, delicious and deeply addictive dish, this pasta alla Sorrentina recipe sees a cherry tomato sauce combined with fresh basil, smoked scamorza cheese and paccheri pasta.',
  'https://www.greatitalianchefs.com/recipes/pasta-alla-sorrentina-recipe',
  'greatitalianchefs.com',
  1,
  1
  ),
  ('World''s Best Lasagna',
  'https://www.allrecipes.com/thmb/lJKo8R_F8xfqyf_r5pWRMrHCu94=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/23600-worlds-best-lasagna-DDMFS-4x3-1196-24c5401652934ffb96d3d94bc9fbe2d7.jpg',
  'This lasagna recipe takes a little work, but it is so satisfying and filling that it''s worth it!',
  'https://www.allrecipes.com/recipe/23600/worlds-best-lasagna/',
  'allrecipes.com',
  1,
  1
  ),
  ('Crab linguine with chilli & parsley',
  'https://images.immediate.co.uk/production/volatile/sites/30/2011/02/Crab-linguines-with-parsley-9ef8ba4.jpg?quality=90&webp=true&resize=375,341',
  'Keep it simple with this restaurant-style crab linguine with chilli and parsley – it takes a few good-quality ingredients and lets them shine',
  'https://www.bbcgoodfood.com/recipes/crab-linguine-chilli-parsley',
  'bbcgoodfood.com',
  1,
  1
  ),
  ('Chitarra With Roasted Garlic Sauce',
  'https://mateo.kitchen/_next/image?url=https%3A%2F%2Fcms.mateo.kitchen%2Fwp-content%2Fuploads%2FDSC00303-1280x1917.jpg&w=1920&q=75',
  'The flavor of this pasta is everything you expect: creamy, garlicky, and rich',
  'https://mateo.kitchen/recipes/chitarra-with-roasted-garlic-sauce',
  'mateo.kitchen',
  1,
  1
  ),
  ('Slow-cooker sticky chinese pork',
  'https://img.taste.com.au/WAMdNk_D/w643-h428-cfill-q90/taste/2018/04/slow-cooker-sticky-chinese-pork-136597-1.jpg',
  'Chinese takeout has nothing on this easy and delicious slow-cooker sticky pork shoulder dish',
  'https://www.taste.com.au/recipes/slow-cooker-sticky-chinese-pork/hkfaxlvb',
  'taste.com',
  1,
  4
  ),
  ('Fresh Spring Rolls with Peanut Sauce',
  'https://cookieandkate.com/images/2019/08/fresh-spring-rolls-recipe-4-768x1154.jpg',
  'These are the fresh, veggie-packed spring rolls I want to order at Thai and Vietnamese restaurants. I can’t say they’re 100 percent authentic, but they’re pretty close.',
  'https://cookieandkate.com/fresh-spring-rolls-recipe/',
  'cookieandkate.com',
  1,
  4
  ),
  ('Thai Crying Tiger',
  'https://www.simplysuwanee.com/wp-content/uploads/2022/06/Authentic-Crying-tiger.jpg',
  'Thai crying tiger recipe is marinaded beef with marinating sauce of oyster sauce, fish sauce, garlic, and soy sauce, then grilled to perfection..',
  'https://www.simplysuwanee.com/the-best-crying-tiger-recipe/',
  'simplysuwanee.com',
  1,
  4
  );


COMMIT;
