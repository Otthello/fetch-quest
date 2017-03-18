# FETCH QUEST
******

Team members: [Rich](https://github.com/rrichardsonv), [Bob](https://github.com/Robertgervais1), [Dereck](https://github.com/DMiller0090), [Vadim](https://github.com/Brandv)
****

### Team norms:

- A deep ~~dislike~~ ~~begrudging~~ respect of Travis CI builds
- Horizontal team structure
- Stand-ups at 9:00am, 2:10pm, and 5:30pm
- Pass the baton if you get stuck
- Do not suffer in silence

****

### Setup:

1. Fork the repo
2. Use Travis CI to verify that you have the stable build
3. Deploy to your webservice of choice (recommend running the test suite
4. Migrate and Seed the database
5. Check the logs, the api key for your server will be displayed prominently
6. You're good to go!

### Current Api routes:

>POST */api/v1/users?key=**YOUR_KEY**

Account creation, expects fields [username, email, password]
Returns user token

>POST */api/v1/login?key=**YOUR_KEY**

Expects fields [username, email, password]
Regenerates and returns user token


>DELETE */api/v1/logout?key=**YOUR_KEY**

Destroys user token


>GET */api/v1/errands?key=**YOUR_KEY**&token=**USER_TOKEN**

Returns json object with User's Errands and associated Quests and NPCs


>POST */api/v1/errands?key=**YOUR_KEY**&token=**USER_TOKEN**

Creates a new Errand and associating it with the User and selecting associated Quests and NPCs


>GET */api/v1/errands?key=**YOUR_KEY**&token=**USER_TOKEN**&options=location

Returns leaner json object with User's Errands' GPS coordinates and associated Quest blurb and NPC portrait


>GET */api/v1/equips?key=**YOUR_KEY**&token=**USER_TOKEN**

Returns a User's inventory


>POST */api/v1/equips?key=**YOUR_KEY**&token=**USER_TOKEN**

Adds a random piece of loot to the User's inventory


## Plans

Currently there are no plans to continue development of this api; however, areas of interest are:

1. Equips is polymorphic allowing for a variety of loot types (crafting and recipes)

2. Adding support for shared Errand lists through a friending join
