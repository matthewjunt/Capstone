#!/bin/bash

echo "------------------------------------------------------------"
echo "User Login/Register Tests"
echo "------------------------------------------------------------"
#register new user test
#NOTE: must change email each time or error will be returned (email already exists)
echo -e "\n\n"
echo "Register"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/register/ -H "Content-Type: application/json" -d '{"email": "bob4@gmail.com", "password": "123capstone"}'
#login test
echo -e "\n\n"
echo "Login"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/login/ -H "Content-Type: application/json" -d '{"email": "bob@gmail.com", "password": "123capstone"}'

echo -e "\n\n"
echo "------------------------------------------------------------"
echo "Save Recipe Tests"
echo "------------------------------------------------------------"
# save new recipe
echo -e "\n\n"
echo "Save Recipe: Test Recipe1"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/save-recipe/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com", "title": "Test Recipe1", "image": "https://example.com/delicious-recipe.jpg", "id": "1234"}'
# get saved recipes
echo -e "\n\n"
echo "Get Saved Recipes"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/get-saved-recipes/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com"}'
# delete new recipe
echo -e "\n\n\n"
echo "Delete Recipe Test Recipe1"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/delete-recipe/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com", "id": "1234", "title": "Test Recipe1", "image": "https://example.com/delicious-recipe.jpg"}'
# get saved recipes again
echo -e "\n\n"
echo "Get Saved Recipes Again"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/get-saved-recipes/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com"}'

echo -e "\n\n"
echo "------------------------------------------------------------"
echo "Meal Plan Tests"
echo "------------------------------------------------------------"
# generate meal plan
echo -e "\n\n"
echo "Generate Meal Plan: Day meal plan, 2000 Calories, Vegetarian"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/api/get-meal-plan/ -H "Content-Type: application/json" -d '{"timeFrame": "Day", "targetCalories": 2000, "diet": "vegetarian", "exclude": ["dairy"]}'

# save new meal plan
echo -e "\n\n"
echo "Save Meal Plan: Day meal plan - Test Recipe1, Test Recipe2, Test Recipe3"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/save-meal-plan/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com", "time": "day", "meals": [{"title": "Test Recipe1", "image": "https://example.com/delicious-recipe.jpg", "id": "1234"}, {"title": "Test Recipe2", "image": "https://example.com/delicious-recipe.jpg", "id": "1235"}, {"title": "Test Recipe3", "image": "https://example.com/delicious-recipe.jpg", "id": "1236"}]}'
# get saved meal plans
echo -e "\n\n"
echo "Get Saved Meal Plans"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/get-meal-plans/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com"}'
# delete new meal plan
echo -e "\n\n"
echo "Delete Saved Meal Plan"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/delete-meal-plan/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com"}'
# get saved meal plans again
echo -e "\n\n"
echo "Get Saved Meal Plans Again"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/user_api/get-meal-plans/ -H "Content-Type: application/json" -d '{"email": "matt@gmail.com"}'

echo -e "\n\n"
echo "------------------------------------------------------------"
echo "Search Tests"
echo "------------------------------------------------------------"
# search
echo -e "\n\n"
echo "Search: 'Italian'"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/api/search-query/ -H 'Content-Type: application/json' -d '{"query": "Italian", "number": 10}'

# random recipe
echo -e "\n\n"
echo "Random Recipes"
curl -X GET https://backend-deploy-cb05f4d199a3.herokuapp.com/api/get-random-recipes/ -H "Content-Type: application/json"

# recipe by id
echo -e "\n\n"
echo "Recipe by ID: 658936"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/api/get-recipe/ -H "Content-Type: application/json" -d '{"id": "658936"}'

# complex search
echo -e "\n\n"
echo "Complex Search: Burger, Options: American, main course"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/api/complex-search/ -H "Content-Type: application/json" -d '{"query": "Burger", "cuisine": ["American"], "type": "main course", "maxReadyTime": 120}'

echo -e "\n\n"
echo "------------------------------------------------------------"
echo "Recipe Recommendations Tests"
echo "------------------------------------------------------------"
# recipe recommendations
echo -e "\n\n"
echo "Recipe Recommendations: Inputted ingredients: Steak, Rice, Broccoli, Carrots, Onions"
curl -X POST https://backend-deploy-cb05f4d199a3.herokuapp.com/api/recipe-recommendations/ -H "Content-Type: application/json" -d '{"ingredients": [{"name": "Steak", "quantity": "1", "unit": "unit"}, {"name": "Rice", "quantity": "2", "unit": "unit"}, {"name": "Broccoli", "quantity": "1", "unit": "unit"}, {"name": "Carrots", "quantity": "0.5", "unit": "unit"}, {"name": "Onions", "quantity": "1", "unit": "unit"}]}'
echo -e "\n\n"