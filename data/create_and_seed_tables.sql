BEGIN;

-- DROP TABLES --

DROP TABLE IF EXISTS "user", "recipe", "category";


-- CREATE TABLES --
CREATE TABLE "user" (
  "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
VALUES
('Alex Tensorer', 'alext@me.com', 'testpassword1*'),
('Edgar Cat', 'edgar@cat.com', 'miaow2013*');

INSERT INTO "category" ("name", "image")
VALUES
  ('Pasta', 'https://www.giallozafferano.com/images/228-22819/Spaghetti-Carbonara-Bacon-and-egg-spaghetti_1200x800.jpg'),
  ('Mexican', 'https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-carnitas-recipe.jpg'),
  ('Salad', 'https://media-cdn2.greatbritishchefs.com/media/1y1fbz4k/img27439.whqc_1426x713q80fpt480fpl650.webp'),
  ('Asian', 'https://hot-thai-kitchen.com/wp-content/uploads/2021/04/jungle-curry-blog-1.jpg'),
  ('Barbecue', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Big-John-s-Chili-Rubbed-Ribs_EXPS_SFBZ23_119906_P2_MD_11_17_2b.jpg?resize=700,700'),
  ('Traditional', 'https://media-cdn2.greatbritishchefs.com/media/mdhlgvfa/img10614.whqc_768x512q80fpt343fpl593.webp'),
  ('Indian', 'https://media-cdn2.greatbritishchefs.com/media/qi0bw4or/img71955.whqc_768x512q80.webp'),
  ('Healthy', 'https://img.jamieoliver.com/jamieoliver/recipe-database/89080985.jpg?tr=w-800,h-600'),
  ('Vegetarian', 'https://www.feastingathome.com/wp-content/uploads/2022/02/Mushroom-Risotto_-17-683x1024.jpg'),
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
  2,
  2
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
  'This classic Thai dish is called "jungle curry" or gaeng pa because there are so many plants in it that it''s like a whole jungle in a bowl! Healthy, herbaceous, and fiercely spicy - this curry packs all the flavours that are iconic to Thailand.',
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
  2,
  1
  ),
  ('One Pot Melty Burrata Lemon Pesto Pasta',
  'https://www.halfbakedharvest.com/wp-content/uploads/2021/07/One-Pot-Melty-Burrata-Lemon-Pesto-Pasta-3-700x1050.jpg',
  'This simple summery pesto pasta is made in under 30 minutes, uses just one pot, and is a great way to use up all that summer basil. Made with creamy melted burrata cheese, homemade pistachio basil, a touch of garlic, and finished with fresh basil and lemon',
  'https://www.halfbakedharvest.com/burrata-lemon-pesto-pasta/',
  'halfbakedharvest.com',
  1,
  1
  ),
  ('Spinach, lemon and garlic penne rigate with torn burrata',
  'https://media-cdn2.greatbritishchefs.com/media/5oih5nr1/img47775.whqc_768x512q80.webp',
  'Special but simple egg yolk, olive oil, lemon and garlic flavours come together to make a creamy and satisfying sauce while spinach, hazelnuts and burrata finish the dish beautifully',
  'https://www.greatbritishchefs.com/recipes/spinach-pasta-with-burrata-recipe',
  'greatbritishchefs.com',
  2,
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
  2,
  1
  ),
  ('Mushroom & Leek Pasta With Garlic Bruschette',
  'https://kitchenjoyblog.com/wp-content/uploads/2020/04/mushroom-leek-pasta-gordon-ramsey-kitchen-joy-0652-768x1152.jpg',
  'A simple dish of pasta with a creamy mushroom sauce and fresh garlic bruschetta. Leeks are a fantastic ingredient - cheap and easy to work with and they give a subtle savoury flavour. ',
  'https://kitchenjoyblog.com/mushroom-and-leek-pasta/',
  'kitchenjoyblog.com',
  2,
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
  2,
  1
  ),
  ('The Holiday - Christmas Fettuccine',
  'https://www.simplyscratch.com/wp-content/uploads/2017/12/Christmas-Fettucine-l-SimplyScratch.com-13-768x1151.jpg',
  'Christmas Fettuccine is a fancy yet super simple pasta dish consisting of finely minced shallots, garlic, white wine, cream and butter. Diced tomato and minced fresh parsley and torn basil give this fettuccine its red and green Christmas flair.',
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
  2,
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
  2,
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
  2,
  4
  ),
  ('Tomato Burrata Salad',
  'https://www.fifteenspatulas.com/wp-content/uploads/2019/08/Tomato-Burrata-Salad-Fifteen-Spatulas-1-640x959.jpg',
  'Peak perfect heirloom tomatoes with creamy burrata cheese is one of the best food combinations in existence. This Tomato Burrata Salad recipe is outrageously delicious, and so easy to put together',
  'https://www.fifteenspatulas.com/tomato-burrata-salad/',
  'fifteenspatulas.com',
  1,
  3
  ),
  ('Griddled Baby Gems with balsamic & goat’s cheese',
  'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/baby-gem-c7272c4.jpg?quality=90&webp=true&resize=300,272',
  'Try a new way with lettuce and griddle your leaves on a high heat griddle pan or even on the BBQ. Serve with vinaigrette and creamy cheese',
  'https://www.bbcgoodfood.com/recipes/griddled-baby-gems-balsamic-goats-cheese',
  'bbcgoodfood.com',
  2,
  3
  ),
  ('Fig, mozzarella and serrano ham salad',
  'https://images.immediate.co.uk/production/volatile/sites/2/2018/09/Figs-9035f61.jpg?quality=90&webp=true&resize=1200,1090',
  'Make this stunning fig salad for a light and easy summer starter. Figs are marinated in a honey mustard dressing, then tossed with creamy mozzarella, salty serrano ham and peppery rocket',
  'https://www.olivemagazine.com/recipes/entertain/marinated-figs-with-mozzarella-and-serrano-ham/',
  'olivemagazine.com',
  1,
  3
  ),
  ('Balsamic courgette, pine nuts and Parmesan salad',
  'https://www.sainsburysmagazine.co.uk/uploads/media/720x770/02/4912-BalsamicCourgetteSalad1120.jpg?v=1-0',
  'Easy, fresh and low calorie and low carb side salad to accompany grilled meats. If you can''t get yellow courgettes then simply double up on the green',
  'https://www.sainsburysmagazine.co.uk/recipes/salads/balsamic-courgette-pine-nuts-and-parmesan-salad',
  'sainsburysmagazine.co.uk',
  1,
  3
  ),
  ('15 Minute Greek Cucumber Salad',
  'https://www.healthyseasonalrecipes.com/wp-content/uploads/2014/05/chopped-greek-salad-026.jpg',
  'This cucumber Greek salad made without lettuce is a refreshing and delicious side salad that is all about the raw fresh vegetables. ',
  'https://www.healthyseasonalrecipes.com/15-minute-greek-cucumber-salad/',
  'healthyseasonalrecipes.com',
  1,
  3
  ),
  ('Watermelon Salad With Feta, Cucumber, And Mint',
  'https://www.themediterraneandish.com/wp-content/uploads/2023/05/TMD-Watermelon-salad-WEB-29.jpg',
  'Watermelon salad is the essence of summer. The refreshing combination of sweet watermelon, cool cucumbers, and salty feta with a pop of fresh mint',
  'https://www.themediterraneandish.com/watermelon-salad-with-cucumber-feta/',
  'themediterraneandish.com',
  1,
  3
  ),
  ('Niçoise Salad',
  'https://www.recipetineats.com/wp-content/uploads/2021/02/Salade-Nicoise-v2_3.jpg',
  'Hefty and interesting enough for lunch, but not so heavy it loses its summery personality. Though mind you, I happily serve this year-round',
  'https://www.recipetineats.com/nicoise-salad-french-salad-with-tuna/',
  'recipetineats.com',
  1,
  3
  ),
  ('Greek Chickpea Salad',
  'https://hips.hearstapps.com/hmg-prod/images/greek-chickpea-salad-lead-64123cc7c0562.jpg?crop=1xw:1xh;center,top&resize=1200:*',
  'It''s got all the flavors you love from Greek salad, turned into something more substantial and filling that pairs well with almost anything',
  'https://www.delish.com/cooking/recipe-ideas/a43149265/greek-chickpea-salad-recipe/',
  'delish.com',
  1,
  3
  ),
  ('Melon Salad With Citrus Honey Mint Dressing',
  'https://therecipecritic.com/wp-content/uploads/2021/07/melonsaladhero-667x1000.jpg',
  'There isn’t much I love more than a simple recipe that packs a punch! This melon salad has only a few ingredients and delivers on taste, ease AND it looks impressive!',
  'https://therecipecritic.com/melon-salad/',
  'therecipecritic.com',
  1,
  3
  ),
  ('Mushroom Risotto',
  'https://www.simplyrecipes.com/thmb/1KsACWCt2XagV5Ye2S0-QB91hF8=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Simply-Recipes-Mushroom-Risotto-LEAD-5-672fa8b8d42144edb372ff02b760a0a9.JPG',
  'This rich and creamy mushroom risotto recipe is made with risotto rice, Parmesan cheese, brandy, and mushrooms. It’s the ultimate comfort food meal',
  'https://www.simplyrecipes.com/recipes/mushroom_risotto/',
  'simplyrecipes.com',
  1,
  9
  ),
  ('Italian Baked Beans and Greens',
  'https://www.feastingathome.com/wp-content/uploads/2021/09/Italian-Baked-Beans-26-1024x1536.jpg',
  'This recipe for Italian Baked Beans will make good use of your Homemade Marinara Sauce or Oven Roasted Tomato Sauce. Fold in lacinato kale and fresh mozzarella to create a cozy vegetarian meal',
  'https://www.feastingathome.com/italian-baked-beans-and-greens/',
  'feastingathome.com',
  1,
  9
  ),
  ('Vegetarian Stuffed Peppers',
  'https://images.themodernproper.com/billowy-turkey/production/posts/2019/Vegetarian-Stuffed-Peppers-22.jpg?w=1200&q=82&fm=jpg&fit=crop&dm=1599768677&s=32bf809682ba0969f52ba6da24a5cff4',
  'Vegetarian stuffed peppers—baked until tender and brimming with a taco-seasoned, cheesy bean-and-rice filling—are an easy, healthy dinner that’s sure to spice up your week',
  'https://themodernproper.com/vegetarian-stuffed-peppers',
  'themodernproper.com',
  1,
  9
  ),
  ('Frittata Recipe, plus 5 Variations',
  'https://cdn.loveandlemons.com/wp-content/uploads/2018/12/IMG_15318-cropped.jpg',
  'Learn how to make a frittata with this simple guide + 5 recipe variations! Perfect for any meal from brunch to dinner, they''re easy and delicious',
  'https://www.loveandlemons.com/frittata-recipe/',
  'loveandlemons.com',
  1,
  9
  ),
  ('Shakshuka With Feta',
  'https://static01.nyt.com/images/2023/05/03/multimedia/MC-Shakshuka-with-Feta2/03MOSTSAVED-Roundup-Shakshuka-with-Feta2-zhwm-blog480.jpg?w=1280&q=75',
  'Shakshuka may be at the apex of eggs-for-dinner recipes, though in Israel it is breakfast food, a bright, spicy start to the day with a pile of pita or challah served on the side',
  'https://cooking.nytimes.com/recipes/1014721-shakshuka-with-feta',
  'cooking.nytimes.com',
  2,
  9
  ),
  ('Chipotle Cheddar Chicken Burgers',
  'https://www.halfbakedharvest.com/wp-content/uploads/2023/07/Chipotle-Cheddar-Chicken-Burgers-1.jpg',
  'Smoky, slightly spicy, chipotle-seasoned chicken burgers grilled until crispy with melty cheddar cheese',
  'https://www.halfbakedharvest.com/chipotle-cheddar-chicken-burgers/',
  'halfbakedharvest.com',
  2,
  2
  ),
  ('Authentic Carne Asada',
  'https://thestayathomechef.com/wp-content/uploads/2014/10/Carne-Asada-1.jpg',
  'Marinated flank steak is grilled to perfection for the best Authentic Carne Asada recipe. This tender, grilled meat is full of authentic Mexican flavor',
  'https://thestayathomechef.com/authentic-carne-asada/',
  'thestayathomechef.com',
  1,
  2
  ),
  ('Perfect Fish Tacos',
  'https://hips.hearstapps.com/hmg-prod/images/190307-fish-tacos-112-1553283299.jpg?crop=1xw:0.84375xh;center,top&resize=980:*',
  'Any flaky variety or fish, like cod or tilapia, marinated in a mixture of lime juice, chili powder, and cumin that will become your standard',
  'https://www.delish.com/cooking/recipe-ideas/recipes/a53296/easy-fish-taco-recipe/',
  'delish.com',
  1,
  2
  ),
  ('Black Bean Stuffed Sweet Potatoes',
  'https://www.twospoons.ca/wp-content/uploads/2020/03/mexican-stuffed-sweet-potatoes-with-black-beans-vegan-gluten-free-easy-recipe-16.jpg',
  'This recipe uses fresh ingredients like tomato, cilantro, corn and black beans. Stuffed into sweet potatoes and topped with an easy guacamole',
  'https://www.twospoons.ca/mexican-stuffed-sweet-potatoes/',
  'twospoons.ca',
  1,
  2
  ),
  ('Spicy meatballs with chilli black beans',
  'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/spicy-meatballs-with-chilli-black-beans-9363d4f.jpg?quality=90&webp=true&resize=702,637',
  'Give your favourite meatballs a healthy makeover with this low fat, low calorie, low GI recipe with turkey mince, black beans and avocado',
  'https://www.bbcgoodfood.com/recipes/spicy-meatballs-chilli-black-beans',
  'bbcgoodfood.com',
  1,
  2
  ),
  ('The BEST Carnitas',
  'https://www.foodiecrush.com/wp-content/uploads/2022/04/Carnitas-foodiecrush.com-23.jpg',
  'This authentic Mexican carnitas recipe features pork shoulder and aromatics like garlic, onion, orange, and spices cooked low and slow on the stovetop or in the oven',
  'https://www.foodiecrush.com/carnitas/',
  'foodiecrush.com',
  2,
  2
  ),
  ('Mexican Shrimp Ceviche',
  'https://stellanspice.com/wp-content/uploads/2022/03/IMG_7290-1536x2048.jpeg',
  'Tostadas are one of my favorite Mexican street foods and my favorite kind of tostada is with shrimp ceviche! It''s healthy, super refreshing, and really easy to make',
  'https://stellanspice.com/mexican-shrimp-ceviche/',
  'stellanspice.com',
  1,
  2
  ),
  ('Honey BBQ Chicken Wings',
  'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/4c41b09cf41644a7b7ca1780edbeb960/BFV8354_Honey_BBQ_Chicken_Wings-FB1080.jpg?resize=1200:*',
  'These sweet and sticky honey BBQ chicken wings are the ultimate game day food that everyone will love',
  'https://tasty.co/recipe/honey-bbq-chicken-wings',
  'tasty.co',
  1,
  5
  ),
  ('Grilled Vegetables',
  'https://www.foodiecrush.com/wp-content/uploads/2019/06/Grilled-Vegetables-foodiecrush.com-019-2-768x1152.jpg',
  'After years of practice on the grill, these are my tips for the best easy grilled vegetables, enhancing the natural sweetness of summer’s favorite vegetables with each smoky bite',
  'https://www.foodiecrush.com/best-easy-grilled-vegetables/',
  'foodiecrush.com',
  1,
  5
  ),
  ('Sous Vide Smoked Brisket Recipe',
  'https://www.seriouseats.com/thmb/_QUVWGjLTxwteT81jynGWjDg0X0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2016__07__20160801-sous-vide-brisket-guide-35-460f78a538054fc69bd97f2e16b4bd74.jpg',
  'Through sous vide cooking, you can achieve consistently moist and tender brisket at home',
  'https://www.seriouseats.com/sous-vide-barbecue-smoked-bbq-brisket-texas-recipe',
  'seriouseats.com',
  2,
  5
  ),
  ('Slow Cooker Ribs',
  'https://img.buzzfeed.com/video-api-prod/assets/81733b053eaf4e6c851a676b20798932/BFV6085_Slow-Cooker-Ribs_Thumb.jpg?output-format=auto&output-quality=auto&resize=600:*',
  'With these baby back ribs, you won’t even miss going to Chili’s anymore. ',
  'https://tasty.co/recipe/slow-cooker-ribs',
  'tasty.co',
  2,
  5
  );



COMMIT;
