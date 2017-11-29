# Butter Grams
The idea for this project came out of the need to dine on a budget. There are always restaurants that have that one dish you have to have, but it can hard to afford it every week. Butter Grams fixes this by allowing users to search for their favorite restaurants in NYC, view menus, select menu items, and then receive a similar recipe with cost of ingredients. If a user creates an account, they are able to save their favorite alternative recipes for use later.

The live site can be found at https://buttergram.herokuapp.com/

## How it Works
This application runs on a Ruby on Rails backend with a PostgreSQL database and a React frontend. We utilized the FourSquare API to search for restaurants using the search term entered and to get the menus. We then used the Edamam API to search for similar recipes based on the menu item name. Once the recipe is received from the API the app searches the database, seeded from a CSV, with ingredient costs and multiplies the cost and the quantity necessary for the recipe. 

## Future Addtions
- Continue migrating stying to semantic react
- Improve Regex for picking out ingredient names from recipes
- Improve ingredient costing through another API or improved CSV

## Team Members
[Caitlin Keck](https://github.com/catkeck)
[Luke Pierotti](https://github.com/lukepierotti)
