require 'pg'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

COMMENTS = [
  ["Jose", "this recipe sucks"],
  ["Jose", "this is alright"],
  ["Serg", "hi"],
  ["Emerson", "waddup"]
]
#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE

def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

db_connection do |conn|
  TITLES.each do |title|
    conn.exec_params("INSERT INTO recipes (recipe_name) VALUES ($1)", [title])
  end
end

db_connection do |conn|
  COMMENTS.each do |user, comment|
    conn.exec("INSERT INTO comments (user_name, user_comment) VALUES ($1, $2)",
            [user, comment]
             )
  end
end

#SQL Code
# 1. SELECT recipe_name FROM recipes;
# 2. SELECT * FROM comments;
# 3. SELECT comments.user_name, comments.user_comment, recipes.recipe_name FROM comments INNER JOIN recipes ON recipes.id = comments.recipe_id;
# 4. SELECT comments.user_name, comments.user_comment, recipes.recipe_name FROM comments INNER JOIN recipes ON recipes.id = comments.recipe_id WHERE recipes.id = 1;
# 5. INSERT INTO recipes (recipe_name) VAlUES (Brusssels Sprouts with Goat Cheese);
# INSERT INTO comments (user_name, user_comment, recipe_id) VALUES (alex, its aight, 12);
# INSERT INTO comments (user_name, user_comment, recipe_id) VALUES (jose, what he said, 12);
