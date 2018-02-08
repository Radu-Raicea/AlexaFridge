<p align="center">
    <img src="app/assets/images/side_logo.png" alt="logo" width="800px">
</p>
<p align="center">
    Alexa Fridge is an app that suggests what to cook based on what ingredients you currently have.
</p>


### Requirements

* Ruby 2.3.3+

* Rails 5.1.4+

* Bundler

* ngrok

### Running the app

1. Install dependencies `bundle install`

2. Migrate the database `rails db:migrate`

3. Seed the database `rails db:seed`

4. Run ngrok `ngrok http 3000`

5. Copy the https link on the Amazon Developers website for your Skill

6. Run the server `rails server`
