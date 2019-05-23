# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
      - Application is built with the Sinatra framework and is deployed on Heroku.
- [x] Use ActiveRecord for storing information in a database
      - ActiveRecord is connected to a Postgres database.
- [x] Include more than one model class (e.g. User, Post, Category)
      - Espresserhead uses 3 models: User, Coffee, and CoffeeList.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
      - User: has_many :coffee_lists, has_many :coffees, through: :coffee_lists
      - CoffeeList: has_many :coffees
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
      - Coffee: belongs_to :coffee_list
      - CoffeeList: has_many :coffees, belongs_to :user
- [x] Include user accounts with unique login attribute (username or email)
      - User account creation validates uniqueness for both username and email and will not let a user create an account with existing credentials.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      - CoffeeList model has routes for all four CRUD functions.
- [x] Ensure that users can't modify content created by other users
      - Uses current_user method to check content ownership before allowing modification.
- [x] Include user input validations
      - Includes validations for inputs on all three models.
        - User: validates username (presence, uniqueness, length), email (presence, uniqueness), and password (presence, length).
        - Coffee: validates name (presence, length), coffee list id (presence, numericality), rating (presence, numericality),                  prep method (presence), origin (presence), roast (presence), and notes (length).
        - CoffeeList: validates list name (presence, length) and list description (length).
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
      - Displays flash error messages for failed account creation and failed login attempt.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
