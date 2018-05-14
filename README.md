# FlyMyStuff Rails Project
[flymystuff.herokuapp.com](flymystuff.herokuapp.com)
## Introduction
Flymystuff is a global network connecting international Shoppers with Flyers who have baggage space to spare.

Quite often, people who have travelled overseas and returned, find themselves craving for more of a favourite item or items that they have bought at a store but have been unable to find online stores that can ship the item over to them, or perhaps the postage costs outweigh the benefits, or the postage takes far too long to reach them and could be lost. 

Flymystuff offers a way for these **Shoppers** to connect with **Flyers** who will be travelling to their place of interest and returning to the **Shopper's** location. 

### How it works
1. **Shoppers** post a 'Flyte' listing for an item at a location they wish to acquire, with the price that they are willing to pay for the item (price should include: price of item, and the delivery tip) and a preferred date they would like to receive the item.
2. A **Flyer** can then accept the *Flyte* and once matched, the **Shopper** is automatically charged a 7% fee of the price they listed for the *Flyte*. No payment is made to the **Flyer** at this stage.
3. The **Flyer** must then provide details of when they are:
    * leaving their overseas location
    * arriving at the **Shopper's** location
3. The **Flyer** is then responsible for purchasing the item in the overseas location and bringing it back with them to the **Shopper's** location. Through the app, the **Flyer** provides regular updates of the item's transit status.
4. The **Flyer** and **Shopper** then agree on how the item is to be handed over once the **Flyer** is in town (Postage / Pickup).
5. Once the item has exchanged hands and the **Shopper** is satisfied, the **Shopper** marks the *Flyte* as complete, and the **Flyer** automatically gets paid.

### Problem
My inspiration for Flymystuff stems from my experience as a migrant from Singapore, where upon moving to a foreign country like Australia, one realises that there are certain items such as food, clothing, accessories or appliances that are either hard to find or unavailable for purchase locally. A common practice therefore is an almost silent agreement that if a close friend or family member is travelling to a location where you want the item, you ask politely for them to bring it back for you. And of course, this works vice versa.

While online shopping has no doubt played a pivotal role in connecting buyers to global marketplaces, high postage/shipping costs and frequently changing tax rulings constitute high barriers of entry to these buyers. 

Postage/shipping from overseas countries also tend to be unpredictable, with very little relevant information provided even with "tracking services". Parcels tend to be delivered at inconvenient times with very no means of specifying a delivery date, time or location.

Online shops also rarely provide the same rich amount of product variety that local stores overseas have. 

The freedom that users have to purchase items from local stores overseas and connect with travellers willing to carry such items addresses such concerns.

### Solution
Flymystuff allows **Shoppers** to post requests for items to be purchased and brought back to their locale. Users (**Flyers**) travelling to such locales may then respond to relevant requests, offering to take up the task of purchasing and bringing the item(s) with them to the **Shopper's** locale.

Once **Shoppers** and **Flyers** have agreed, Flymystuff holds the **Shopper's** payment, giving the **Flyer** security to know that they can then purchase the item and carry out the delivery.

The **Shopper** and **Flyer** then agree on a suitable location, date and time for the item to exchange hands. Once the item is received, the **Shopper** then completes the transaction, known as a "Flyte" on the app, and the **Flyer** receives their payment.

## Technologies
* **Database:** PostgreSQL
* **Version Control:** Git
* **Deployment:** Heroku
* **File Storage:** AWS S3
* **Development Framework:** Ruby on Rails
    * Rspec (testing)
    * Devise (user authentication)
    * Mailgun (mailer functions)
    * Paperclip (file processing)
    * ImageMagick (image processing)
    * Stripe (payment processing)
### Additional Tools
* Kanban Board (User Stories) Tracking - [Trello](https://trello.com/) 
* Task Timing - [PomoDoneApp](pomodoneapp.com)
* User Journeys - [Draw.io](https://www.draw.io)
* Database Design - [DB Designer](dbdesigner.net)
* Wireframing/UI - [Figma](figma.com)
    * iOS Frame - [iOS Design Kit](https://iosdesignkit.io/ios-11-gui/)
### User Stories, User Journey
![Trello Board](docs/img/Trello.png)

I followed some principles outlined in a Screenful blog post "[Tracking user stories with Trello](https://screenful.com/blog/tracking-user-stories-with-trello)", as I wanted to design features from the perspective and needs of end-users.
User Journeys were mapped out using [draw.io](https://www.draw.io). I initially created an overall diagram depicting the macro-level of how a transaction would occur between a "Shopper" user and a "Flyer" user.
I then went on to draw detailed diagrams of each user's perspective of the system.

![User Workflow](docs/img/user_workflow.png)

### Entity-Relationship Diagram (Database Schema)
![ERD](docs/img/erd.png)

### Wireframing & Basic UI
![Figma](docs/img/figma.png)
#### CSS Inspirations
* [Navbar](https://codepen.io/matthew-tanner/pen/rvOxEB)
* [Landing Page Grid](https://codepen.io/zayncollege/pen/rpWrpP)
* [Cards](https://codepen.io/cssgirl/pen/NGKgrM)

## Rails Programming
### Considerations
* Each user has one profile and for MVP purposes, one address only
    * can be expanded to > 1 address to facilitate postage to addresses other than personal address
* Address currently validates for "State" to be filled -- does not work for countries that do not have states/regions/provinces

### Incomplete Tasks
* Flyte status and progression to completion
    * Payment to **Flyer** once delivery completed
    * Image upload for **Flyer** to show possession of item and item condition
    * Inputs for **Flyer** to update progress
    * Inputs for **Shopper** to request updates
* Messaging system between **Shopper** and **Flyer**
* Mailer notifications for:
    * Responses to Listings
    * Flyte status & progression
* Geocode maps to display **Shopper** and **Flyer** cities
* Allow users to refine and search through Listings for cities or items of interest
* A "Suggestions" page, showing items freuqently requested from particular cities