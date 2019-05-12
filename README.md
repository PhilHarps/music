# Two-side Marketplace : A study in developing on Ruby-on-Rails in the blind

https://secret-mountain-45294.herokuapp.com/

Codebase: https://github.com/rachelwong/music

[Presentation](readme_assets/rails_presentation)

---

## Defining Purpose and Problem

> What is the need (i.e. challenge) that you will be addressing in your project?

Queensland public and private primary and secondary schools have for years enjoyed a robust and comprehensive [musical and arts program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program) as part of their baseline education curriculum. More than 400 instrumental teachers and over 50,000 students are currently involved in Education Queensland's [Instrumental Music Program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program). Students from grade 3 (age 7-8) to grade 12 (age 17-18) can learn to play band and orchestral instruments (brass, woodwind, percussion, strings) in small groups and participate in larger ensembles, such as concert bands and orchestras.

While each school's musical curriculum may vary in size, it is encumbent upon each school's administration to set aside sufficient annual budgetary allowances to maintain existing inventory (i.e. purchasing replacement parts like woodwind reeds and violin strings) and to acquire new instruments as needed.

> Identify the problem you’re trying to solve by building this particular marketplace App?

The Queensland state government currently sponsors a [World Class Education -- Musical Instruments Funding Initiative](https://education.qld.gov.au/about-us/budgets-funding-grants/grants/state-schools/core-funding/world-class-education-musical-instruments) that dispenses AUD$1 Million over a three-year period to registered state schools in major regions. Nonetheless, by and large orchestral and band musical instruments are largely provided on loan to schools. A casual survey of recent market prices revealed brand-new, student range acoustic instruments can easily run upwards from $700 (single string instruments) to several thousands (large percussion sets) [(see Music Express)](https://musicexpress.com.au/product-category/band-orchestral/cello/?orderby=price). Public listings such as [Gumtree](https://www.gumtree.com.au/s-musical-instruments/brisbane/c18409l3005721) do provide more affordable price ranges but condition, availability and authenticity are less assured. As migration and fertility rates continue to drive up Queensland's [above-national-average population growth](http://www.population.net.au/population-of-queensland/) since 2007, it is expected that all private and public schools in the state will continue to experience high enrolment student intakes in the coming years.

On the other side of the equation, the key challenge for the developer to solve is to learn and understand the building, testing and deployment processes to deliver an operational product using Ruby-on-Rails.

> Why is it a problem that needs solving?

For Queensland schools to deliver quality musical education in the face of growing student demands and high market prices, ready access to quality orchestral instruments at affordable rates is paramount.

**This assignment therefore seeks to improve access to quality musical instrument for Queensland schools by building a walled, two-sided marketplace "Pre:Loved" that allows verified private owners of second-hand musical instruments (i.e. parents of children who may have outgrown their instruments) to sell to primary and high schools at affordable prices.**

The only comparable Australian marketplace that seeks to achieve a similar aim is [Gift of Music](https://www.giftofmusic.org.au/), a non-profit drive helping rural and disadvantaged children gain access to musical instruments through volunteer donations. There appears to be no public listings of instruments available, operating only via private correspondence submitted to their contact form.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/giftOfMusic.png" width="500">

> Describe the project you will be conducting and how your App will address the needs.

- This walled marketplace will shield pricing structure from the general public to service only [registered Queensland schools](https://schoolsdirectory.eq.edu.au/).
- Likewise, private seller details will be hidden from the public and only accessible by verified school accountholders.
- The marketplace does not operate on an open-door policy as the "Pre:Loved Exchange" is not a commercial venture. It only welcomes private sellers willing to sell verified quality musical instruments at compassionate below-market rates.
- Only school account holders may purchase intruments on the site.
- Private sellers can only list instruments that abide by the marketplace's stringent grading policy on condition of the instrument.
- These measures provides a valuable, high-integrity marketplace environment promising both sellers and schools of trustworthy transactions in service of a worthy cause. On the one hand, private citizen sellers can be confident that their preloved musical instruments will go to school students in need, and not for commercial or personal purposes. Likewise, schools who register on the "Pre:Loved Exchange" can enjoy a trusted source of good quality second-hand musical instruments at sympathetic prices.
- The marketplace will not directly handle credit card information of customers. They uses an intermediary service like paypal or Stripe.
- It is expected that each listing is entirely unique, only one of. (i.e. It is highly unlikely in a real world scenario to find two Gibson Acoustic Guitars with exactly the same year, condition and characteristics)

---

### Functionalities

Due to lack of coding experience and fragmented understanding of Ruby-on-Rails, the developer only managed to achieve minimal basic functionalities on the MVP list, which included:

- User account creation and authentication
- User can CRUD own profile, including uploading an avatar image
- Each listing can be part of an index (full list) or individual list
- User can CRUD listings
- There are two types of users: `@user` (seller - to list items only) and `@user.is_school` (school - to buy items only)
- `@user` (seller) can view/manage a list of their own listings from the profile
- Basic keyword Search function on the home page can search through listings via the `description` field
- Listings are sorted by `instrument_type` attribute on the home page
- Images (avatar, listing photos) can be uploaded onto Cloudinary
- Listings can be purchased individually via Stripe
- Image file type validation when uploading (only accepts .png and .jpg file extensions)

---

### Unresolved Problems

- Search bar on the home page is case sensitive, and only searches for words within the `description` field of the listing. Below is an attempt to resolve the issue.

```
class SearchController < ApplicationController
def index
    @listings = Listing.all
    @listings = Listing.where("description LIKE ? OR name LIKE ? OR instrument_type LIKE ?",  "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    end
end
```

- Order cart (with add, remove item) was not successful
- schools can only buy one listing at a time
- UI Alert messages for when a listing has been created, updated or deleted
- Contact us form failed
- Changing log in details (password, name) is nested into editing profile
- delete the listing from the database when it has been successfully purchased (stripe transaction successful)
- add purchased listing into the Purchase history of the school profile
- when an account is first created and the avatar image is uploaded, the image does not appear in the user_path view. The user has to edit their profile and re-upload the avatar image.
- INsufficient resources to attempt R-Spec testing

Overall the codebase is of amateur-quality.

Solutions to problems are naive, repetitive (not DRY) - at times near tautological - brought on by a lack of coding ability and a unclear (at best) understanding of developing on the Rails MVC framework. For example, to display different button functionalities for each type of user (un-logged in user, logged in user, logged in user who is also a school) on different parts of the website, the same control structure is repeated across multiple views.

```
<% if user_signed_in? && current_user.is_school? == true %>
  ...
<% if user_signed_in? && current_user.is_school? == false %>
  ...
<% elsif user_signed_in? == false %>
  ...

<% else %>
// rescue for unauthorised access
<% end %>
```

This repeating control structure could be circumvented by setting down user roles ([rolify](https://github.com/RolifyCommunity/rolify)) to better use a base/super `User` model to differentiate between the types of users, instead of relying on a checkbox boolean value `is_school`.

The Stripe payment transaction feature was also not successfully implemented and had to default to following the code-along example in class.

Partials and centralised styling in `applications.scss` have been used in an attempt to consolidate and centralise some elements such as header, footer, forms, the card used to display each listing. Nonetheless, the quality of the codebase and clunky user experience (i.e. Updating account authentication is nested a second level down from Editing Profile details) demonstrated the ham-fisted coding process of the solo developer. Maintaining the application as it is currently submitted will inevitably accrue compounding technical debt.

---

### Extensible Features

These are features not yet attempted.

- Admin panel section to view all listings by all users and have edit, delete privileges.
- Implement a better `user` super/base model (polymorphism) to encapsulate the two child-types of users (buyers and sellers)
- Use Rolify to define `:admin` role and privileges (CRUD all listings)
- Custom email notifications to users to inform them of their account being verified
- Add a sorting category for instrument's current location
- Add a favourites function to each listing so that school account holders can also view a "Wishlist"
- Implement an "order received" notification to the site owner's email address for paper-trail
- Implement [GDPR-Rails gem](https://github.com/prey/gdpr_rails) gem for data privacy
- Implement [Better Errors gem](https://github.com/BetterErrors/better_errors) for better error messages and debugging when developing in future

---

### Screenshots

[See Screenshots here](readme_assets/screenshots.md)

### Tech Stack

> Identify and describe the software to be used in your App.

- HTML, CSS3, SCSS for visual styling
- GitHub for version control
- Ruby-on-Rails for development
- RSpec for testing
- Active Storage native to rails to handle file uploads and downloads
- Heroku for deployment
- Rails Gems (see below) for extending functionalities beyond MVC

> Describe the network infrastructure the App may be based on.

The hosting provider is Heroku for this application.

Upon deployment, the codebase is run on a virtual machine known as 'dyno'. More dynos available on an application can handle more HTTP requests, especially for applications expecting high traffic. When an application is deployed and allocated to a dyno, the heroku router can receive and pass through HTTP requests from the user to the server. If the applciation owner is on a free plan, there is a certain restriction to amount of RAM storage and un-billable hours to handle HTTP requests to dyno. Upon deployment, a new instance of the Postgresql is also created along with any database migration and seeing as directed by the user. The heroku version of the databse is accessible via TCP/IP.

Due to resource constraints in this assignment, more time is needed to absorb the content in the [Heroku documentation](https://devcenter.heroku.com/articles/http-routing) and to clearly understand how Heroku actually works.

> Detail any third party services that your App will use.

- **Cloudinary Cloud Storage**: Considerable development time was spent researching and understanding server environments and cloud storage options, including reading AWS documentation. At the recommendation of the tutor MR Matt Stubbs, Cloudinary was chosen to work with Active Storage on rails to store and upload images onto the application once deployed on Heroku.
- **Google Fonts**: Google Fonts are used for logo and body of the text.
- **Stripe**: For handling secure payment transactions and processing of credit card details. Very helpful to outsource credit card authentication and storage outside of the application to mitigate any security risks.
- **Heroku**: Network platform of choice configured with a database, connection to Cloudinary and Stripe.

#### Gem Dependencies

| Gem                                                                                         | What I achieved with it                                                                                                                                                    |
| ------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Devise](https://github.com/plataformatec/devise)                                           | User authentication (log-in, log-out, edit profile) for `@seller` and `@user.is_school` user types                                                                         |
| [Dotenv 2.1.1](https://rubygems.org/gems/dotenv-rails/versions/2.1.1)                       | Installed to load environment variables from .env in test and development environments.                                                                                    |
| [Kaminari](https://github.com/kaminari/kaminari)                                            | Pagination for "View All Listings" and Search results pages                                                                                                                |
| [Cloudinary](https://github.com/cloudinary/cloudinary_gem)                                  | Works with activestorage-cloudinary-service gem to configure the heroku app with an account on Cloudinary to host images and file uploads                                  |
| [Figaro](https://github.com/laserlemon/figaro)                                              | Implemented with the original intention to hide sensitive credentials such as private API keys for Stripe and Cloudinary. In the end, opted for using `.env` file instead. |
| [Stripe](https://github.com/stripe/stripe-ruby)                                             | Implemented a single-item purchase transaction. Fully deployed on heroku.                                                                                                  |
| [activestorage-cloudinary-service](https://github.com/0sc/activestorage-cloudinary-service) | Works with Cloudinary gem to configure the heroku app with an account on Cloudinary to host images and file uploads                                                        |

### Structure of Application

> Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

The application takes after popular 2-sided e-commerce marketplace such as [Etsy](http://www.etsy.com).
However, Etsy will operate on a much higher level of complexity for the database schema

- Users can be buyer and seller at the same time
- User details could be stored in a customer table irrespective of seller or buyer
- Users have many listings
- Each listing will have one user
- Each listing will have many orders (many to many)
- Each order will have many listings (many to many)
- A purchasing history model could be a joining table to merge date, buyer_id, seller_id, order_id, listing_id

Pre:Loved operates on a much simplified and constrained data schema due to the lack of coding expertise.

> Describe the architecture of your App. Explain the different high-level components (abstractions) in your App.

**Model**
The models used in Pre:loved reflects typical ecommerce business logic.

A `User` model holds personal profile information. Depending on whether `is_school` checkbox is ticked upon sign-up, the account can be further divided into a **school (buyer)** or a

The `Order` model is still in development but should store the details of each shopping cart session (numebr of listings, user_id of the user signed in).

**Controllers**

`Users` controller is created from installing the Devise gem and is chiefy

`Listings` controller is responsible for managing all the CRUD operations of listing records. It sanitizes and whitelists the user-inputted data from the create listing form and adds to the database. It also displays listings according to view all and sorting category.

`Search` controller takes a user-inputted key word term from the search field and draws data from the `Listings` table using an SQL query statement. The final result is displayed in a separate page away from `listings` controller.

`Orders` controller is a work in progress and primarily manages the stripe checkout operations of creating a transaction, passing database data to Stripe, and returning a success or cancel resulting page. Ideally this controller could be improved upon to include shoppping cart capabilities.

`Pages` controller simply generates static pages on the website, including about us and contact us page. No interaction with the database is required.

The `Home` controller simply sets up a root page for the hompage of the website.

**Views**

| View Folders |                                                                                                          Operation & Concerns                                                                                                          |
| ------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Layout       |                                                  Manages the look and feel of common elements of the site including header, footer, site-wide partials scss, alert/notice UI elements                                                  |
| Home         |                                               Styles the visual look of the home page only. Depending on the kind of user logged in (or not logged in), it renders a different nav bar.                                                |
| Devise       | Handles the look and different forms for signing up an account, resetting password, editing log in details, forgetting password. These are automatically generated to handle user authentication screens once Devise gem is installed. |
| Users        |                                                      Created two views to handle the editing of user profile (school or seller), and showing the user profile (school or seller).                                                      |
| Search       |                           Creates a new page listing all results that matched the user input to the listings' description field. There is duplication as the look is essentially the same as listings view.                            |
| Listings     |                                   A range of views that handle sorting of listing results by `instrument_type` category, and the view all listing. It also includes all the CRUD screens and forms.                                    |
| Pages        |                                                                 These are simply static pages with no database operations for "About Us" and "Contact Us placeholder"                                                                  |
| Orders       |          Manages the create a new order screen along with two destination static pages (Create/Success and Cancel) for when the stripe transaction is processed and the user is redirected back onto the heroku application.           |

The MVC separation of concerns was demonstrated by data validation handled within the models. Page redirection and ferrying form-submitted data happened in the controllers. And the views display different functions based on the type of user currently logged in.

### Instructions on Local Configuration

> Instructions on how to setup, configure and use your App.

First fork and clone the repo into your local machine.

```
git clone <SSH link from Github>
```

Make sure you have bundler install. Run bundler to install gem dependencies locally.

```
bundle install
```

This application is configured to a specific Cloudinary and Stripe account. So be aware that those functionalities may be affected on your local machine. IF you need to configure those functions to your own settings, make the necessary changes to the Cloudinary and API keys in the `.env` and `orders_controller.html.erb` (stripe public key). If deployment is required, please config your heroku account accordingly in the CLI `heroku config:set STRIPE_API_KEY=whateveryourkeyis`.

---

### Project Plan & Design process

Please note that since this project was undertaken as a solo attempt, the development process did not exhibit the usual Git collaboration history, stand-up, Slack discussions, Kanban board tracking as per the agile development methodology.

> Discuss how Agile methodology is being implemented in your project.

Althought this was a solo effort, a fast, responsive development cycle was used to manage learning and building concurrently. Tasks are first created on Trello (please see below section on how tasks are created), prototypes are pencilled out. The developer took a visual route to set down the look and feel of static pages. Planned functionalities such as sign up buttons on the nav bar are built into the static pages as mock-up placeholders. With the foundation visual look of a product in place, a divide-and-conquer approach was taken to then build each individual trello task, for example, build a sign up form, or an brass instrument sorting page.

To prevent the master codebase from being contaminated, the repo was cloned to create a testing sandbox environment mirroring a latest build version. In this testing environment (nicknamed 'Post:Hate'), the developer can attempt building functionalities from following tutorials online, run validation test using different seeding data. It is in the testing sandbox environment that the developer try out unfamiliar ideas and conduct **unit testing** before progressing to actually building in the development version.

Likewise, for some self-contained functionalities such as building a contact form, a [separate repository](https://github.com/rachelwong/contact-rails) is created to test out ideas and conduct unit testing.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/timeline.png" width="800">

The first week of the development was devoted entirely to gain some familiarity with developing using the Rails framework by doing as many online tutorials, building multiple small projects and redoing classe xercises. This meant that learning and building had to occur in parallel within a compressed build timeframe of one week. The development cycle therefore was an exercise in maintaining a clear sanitisation line between the development environment and the testing environemnt.

| Testing Sandbox Environment                                                                               |                                         Example of Logging issues                                         |
| --------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/rachelwong/music/blob/master/readme_assets/screenshot_test.png" width="400"> | <img src="https://github.com/rachelwong/music/blob/master/readme_assets/thingsAttempted.png" width="400"> |

Once a feature has been rigorously tested through the common through the corner case scenarios on the local machine, it is immediately released into production (heroku). This **Continuous Deployment** approach is highly suitable to the solo project in ensuring that

1. there will always be an MVP in production
2. effectively project manage a large workload operating with a high degree of ambiguity (unfamiliar frameworks and third party services)
3. ensure new features are frequently delivered to the end user.

Once released, the task is then marked complete on trello, and the cycle begins for the next user story on trello.

Any persistent issues that does not hamper the overall performance is noted in a running sheet (as above) to revisit down the track. This ensures that time is managed evenly across attempting all the MVP features of the application.

> Describe the way tasks are allocated and tracked in your project.

[Trello](https://trello.com/b/FVqaST5Q/preloved-2nd-hand-music-instruments-for-school) board is used to log MVP requirements, extensible nice-to-have features, user stories and to track each item as it has been built.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/trello2.png" width="600" />

From training with Thoughtworks at their [LevelUp program](https://levelup.thoughtworks.com/) earlier in 2019, each user story is conceptualised as an actionable scenario that involves a particular input, undergoing a transformational process resulting in an output being returned. Each of these stories could effectively be described as an action. And each action became a task on the trello board. The same process is repeated for when errors and bugs are found on the system, for example, one bug tracking was "User image upload cannot be validated to the correct file extension".

> Provide an overview and description of your Source control process.

If the developer was working in a team, new branches on github could be created for each user story or functionality before merging back to the master copy. This helps prevent the master codebase from being polluted with un-tested code, while allowing multiple functionalities to be developed concurrently by multiple team members. The separate branching will also enable better code review and tracking between team members.

A likely flow of events for feature-branching workflow could be:

- 'git pull' on master branch
- Create a new branch with: `git checkout -b branch-name`
- Commit new work to the new branch
- Push to online repo `git push origin branch-name`
- Checkout back to master `git checkout -b master`
- Go to GitHub and merge into master with a new git pull request
- `git pull` on master branch
- Delete the branch if not required after merging to master `git branch -d branch-name`

---

### Workflow of User Stories

> Provide User Stories for your App

[See user stories and workflows here](readme_assets/user_stories.md)

### Wireframes for your application

> Provide Wireframes for your App.

[See wireframes here](readme_assets/wireframes.md)

### Testing

> Provide an overview and description of your Testing process.

### Database Structure Entity Relationship Diagrams

> Discuss the database relations to be implemented.

A 'User' is connected to each `listing` via `user_id`. A `User` can have many listings. A `User` can be a school-buyer (`is_school? = true`) or a seller (`is_school? = false`). Both types use the same `user` model.

If implemented correctly, because each listing is unique (only one violin of that kind), a `listing` has a one-to-one relationship with an `order` as each listing is unique and only one `user` can make a purchase of the same `listing` at any point in time. Each `order` will have foreigns keys of `user_id` and `listing_id`. `Order` is almost like a joining table. IN a normal ecommerce scenario like Etsy where you can buy more than one of each of listing, the relationship between listing and order would be many to many.

For details please see below.

> Describe your project’s models in terms of the relationships (active record associations) they have with each other.

A `User` can have many `listing` records (i.e. a person can list many instruments for sale). However, each `listing` can only have one `user` (i.e. each instrument listed belongs to only one seller, not two). They are connected by the foreign key `user_id`.

A `User` can have one avatar through the Active Storage tables.

A `Listing` can have one image through the Active Storage tables.

There is currently no `order` model on the project.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/model_schema.png" width="700" />

> Provide your database schema design.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/databaseSchema.png" width="800" />

> Identify the database to be used in your App and provide a justification for your choice.

Rails by nature is database agnostic and will default to MySQL. However, **PostgreSQL** has been chosen for Pre:Loved due to the following:

- The deployment platform defined in the course is [Heroku](https://heroku.com), which uses PostgreSQL natively. While the [ClearDB add-on](https://devcenter.heroku.com/articles/cleardb) is available as a database-as-a-service to bridge MySQL to Heroku, implementing ClearDB will bring a additional learning commitment unachievable to an inexperienced developer flying solo in a compressed two-week timeframe.
- ACID (Atomicity, Consistency, Isolation, Durability) properties of PostgreSQL ensures no data is lost or miscommunicated across the system in the event of failure. This is particulary attractive as the application database holds private personal details of schools and individuals (addresses, emails, names).
- It's free and open source. Low start-up seeding required.
- CRUD performances and data validation are important priorities should Pre:Loved gain traction upon release in the real world. The database may then be required to handle growing amounts of private user information, listings data, with all its accompanying security concerns. MySQL is well suited for straightforward data transactions. However, PostgreSQL will _future-proof_ the application for more complex SQL query executions, faster data latency, read/write/retrieval performance optimisation and even open up avenues to business intelligence analytics.

> Identify and describe the production database setup (i.e. postgres instance).

The database consists of the `Users` and `Listings` tables.

At present, the User table essentially only accounts for one type of user, despite in operation there are two subtypes (sellers and school buyers). The User table contains account authentication credentials (password, username), as well as profile details and the checkbox boolean value `is_school`. When `is_school` is ticked upon account creation, schematically it creates a user account (school buyer user type) which will only have access to buy listing (stripe transaction). When `is_school` is false (unticked). This differentiation is handled by control structures in the views and controllers (see Unresolved Problems) rather than through separate User Devise models. This arrangement creates more development work and unit testing load to ensure that the separation of concerns and functions between the two user types as denoted by `is_school` are kept consistent throughout the entire application. It is an imperfect solution to solve a working problem due to lack of understanding and application of database schematic designs and Rails.

The Listing table references a User as a foreign key to demonstrate the one-to-many relationships between User and Listings.

An active storage table allows the attachment of product images to Listing records and avatar images to User records.

### Security

> Discuss and analyse requirements related to information system security.

There are a [great number](https://guides.rubyonrails.org/security.html) of different recommended measures that can be taken to secure the site. But there isn't enough time and resources to fully research and attempt implementation.

What is clear is that there is no plug-n-play option on the market to fully secure a website application from all angles. For this project, the focus was upon achieving proof-of-concept functionalities, upon which the database schema and MVC structure could be improved with security measures. Such measures could include

- If sessions could be used to temporarily store user ID as they interact with the application, the session hash should be encrypted and avoid storing large, critical data.

```
ActionDispatch::Session::CookieStore.
```

- The application controller for all Rails applications are now protected from cross-site forged requests. This introduces a required security token in all forms generated by Rails, which this project also make use of.

```
protect_from_forgery with: :exception
```

- Sanitize file upload fields (image uploads for listing and avatar) by whitelisting a file name that contains acceptable parameters

> Discuss methods you will use to protect information and data.

Development-wise, a configuration `.env` file was created at the root directory to store sensitive credentials (Api secret keys for Stripe and Cloudinary). This file is added to the `.gitignore` in the root directory so that when the codebase is pushed up to the github (and by extension to Heroku), the `.env` is exempt from the git push but the application can still refer to the credentials and run successfully. Upon deployment to heroku, the secret keys are provided to heroku in the terminal by the user as `heroku config:set STRIPE_SECRET_KEY=whateverthekeyis`.

The Figaro gem was installed but never used. It serves a similar function to .env, which generates instead an `appliation.yml˘ file instead.

The Devise gem helped with the secure authentication and field validation of user sign up and log in.

In terms of securing the system for users:

- Outsource credit card processing and data encryption to dedicated third party service, Stripe
- Account authentication when logging in, signing up, accessing user-specific functions (CRUD listing, Buy listing) using Devise gem
- Collect data from users on a need-to-know basis
- All users have the ability to purge the database of their own personal details
- Heroku has built-in rollback functions, physical and logical backups, SSL to protect sensitive data between user and server
- For future, implement the [audited gem](https://github.com/collectiveidea/audited) to prevent lossy data
- There are no admin panels currently installed on the project. However to protect it from obvious attacks, it may be prudent to give the admin URL a differnet name rather using the obvious www.preloved.com/admin
- The project uses Devise as a way to manage user authentication. CAPTCHAS could be added in future to further protect the user when editing details such as passwords on the database.
- REthink the display of seller contact information even after user account authentication and instead use a contact form, or an intermediary service like a messenging chat bot.
- Include a tick box when users sign up that they agree to give permission to retain and use of their data.
- Encrypt backups of the Postgresql database
- Encrypt personal information on the database with rotating unique keys, or use secured cloud services such as AWS with more ACL options.

By the nature of the website itself (music store), it is unlikely that the database will store critical, classified data such as personal health, financial details.

> Research what your legal obligations are in relation to handling user data.

The _Privacy Act 1988_ is currently in operation in Australia that mandates businesses to protect customer data if their annual turnover is over \$3 million, or that they are

- private sector health service providers
- businesses that sell or purchase personal information
- contractors providing services under a contract with the Australian Government
- credit providers and credit reporting bodies
- operators of a residential tenancy database.

Singularly based on those criteria, it is not immediately clear to the developer that Pre:Loved as a non-profit, low-turnover marketplace selling musical instruments has any _mandatory_ legislative responsibilities in terms of customer data. Formal legal advice must be sought.

However, it is only in the business's best interests to take due diligence to operate - especially in the non-profit space - in an ethical and conscionable manner. Any business should be guided by the principles set out by the European Union's [General Data Protection Regulation](https://eugdpr.org/) to ensure that any data breaches - irrespective of any real harm being committed - should be reported to supervisory authorities and customers within 72 hours. It also requires businesses to observe certain rights of the users, which includes:

- right to be forgotten; have your data deleted on your request.
- to see or change your own data.
- to be notified when a company leaks your data.
- to object to certain processing of your data.
- to request your data as in a compatible format.

It would also be prudent for the business to keep auditing logs of all codebase changes, database changes and transactions as evidence.

### Attribution

This work is licensed under the [Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/) where all parts of the work, including codebase, can be shared and adapted for non-commercial purposes without written permission from the developer.

The developer acknowledges the many open-source resources used in the project, without them the "Pre:Loved" application will not have been possible.

| Source                                        |                                                 How it was used in the project                                                  |
| --------------------------------------------- | :-----------------------------------------------------------------------------------------------------------------------------: |
| [Undraw](https://undraw.co/illustrations)     |               Vector illustrations used in user interface messages (404 errors, success/cancel purchase message)                |
| [Burst](https://burst.shopify.com)            |                     High quality photographs used as banner and as decorative elements throughout the site.                     |
| [Google Fonts](https://fonts.google.com)      |             Gugi and Roboto typefaces have been used as typefaces for the logo identity and body-text respectively.             |
| [Bootstrap styles](https://getbootstrap.com/) | The visual appearance of the forms and site are all derivative of Bootstrap, which helped to cut development time and workload. |

Images of instruments are taken randomly from Google search. They have been used to demonstrate intent and operation of the application and can be removed upon notification.
