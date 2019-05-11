# Two-side Marketplace : A study in developing on Ruby-on-Rails in the blind

https://secret-mountain-45294.herokuapp.com/

Codebase: https://github.com/rachelwong/music

---

## Defining Purpose and Problem

> What is the need (i.e. challenge) that you will be addressing in your project?

Queensland public and private primary and secondary schools have for years enjoyed a robust and comprehensive [musical and arts program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program) as part of their baseline education curriculum. More than 400 instrumental teachers and over 50,000 students are currently involved in Education Queensland's [Instrumental Music Program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program). Students from grade 3 (age 7-8) to grade 12 (age 17-18) can learn to play band and orchestral instruments (brass, woodwind, percussion, strings) in small groups and participate in larger ensembles, such as concert bands and orchestras.

While each school's musical curriculum may vary in size, it is encumbent upon each school's administration to set aside sufficient annual budgetary allowances to maintain existing inventory (i.e. purchasing replacement parts like woodwind reeds and violin strings) and to acquire new instruments as needed.

> Identify the problem you’re trying to solve by building this particular marketplace App?

The Queensland state government currently sponsors a [World Class Education -- Musical Instruments Funding Initiative](https://education.qld.gov.au/about-us/budgets-funding-grants/grants/state-schools/core-funding/world-class-education-musical-instruments) that dispenses AUD$1 Million over a three-year period to registered state schools in major regions. Nonetheless, by and large orchestral and band musical instruments are largely provided on loan to schools. A casual survey of recent market prices revealed brand-new, student range acoustic instruments can easily run upwards from $700 (single string instruments) to several thousands (large percussion sets) [(see Music Express)](https://musicexpress.com.au/product-category/band-orchestral/cello/?orderby=price). Public listings such as [Gumtree](https://www.gumtree.com.au/s-musical-instruments/brisbane/c18409l3005721) do provide more affordable price ranges but condition, availability and authenticity are less assured. As migration and fertility rates continue to drive up Queensland's [above-national-average population growth](http://www.population.net.au/population-of-queensland/) since 2007, it is expected that all private and public schools in the state will continue to experience high enrolment student intakes in the coming years.

On the other side of the equation, the key challenge for the developer to solve is to learn and understand the building, testing and deployment processes to deliver an operational product using Ruby-on-Rails.

> Why is it a problem that needs solving?

**For Queensland schools to deliver quality musical education in the face of growing student demands and high market prices, ready access to quality orchestral instruments at affordable rates is paramount.**

This assignment therefore seeks to improve access to quality musical instrument for Queensland schools by building _a walled, two-sided marketplace "Pre:Loved" that allows verified private owners of second-hand musical instruments (i.e. parents of children who may have outgrown their instruments) to sell to primary and high schools at affordable prices._

The only comparable Australian marketplace that seeks to achieve a similar aim is [Gift of Music](https://www.giftofmusic.org.au/), a non-profit drive helping rural and disadvantaged children gain access to musical instruments through volunteer donations. There appears to be no public listings of instruments available, operating only via private correspondence submitted to their contact form.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/giftOfMusic.png" width="500">

> Describe the project you will be conducting and how your App will address the needs.

- This walled marketplace will shield pricing structure from the general public to service only [registered Queensland schools](https://schoolsdirectory.eq.edu.au/).
- Likewise, private seller details will be hidden from the public and only accessible by verified school accountholders.
- The marketplace does not operate on an open-door policy as the "Pre:Loved Exchange" is not a commercial venture. It only welcomes private sellers willing to sell verified quality musical instruments at compassionate below-market rates.
- Only school account holders may purchase intruments on the site.
- Private sellers can only list instruments that abide by the marketplace's stringent grading policy on condition of the instrument.
- These measures provides a valuable, high-integrity marketplace environment promising both sellers and schools of trustworthy transactions in service of a worthy cause. On the one hand, private citizen sellers can be confident that their preloved musical instruments will go to school students in need, and not for commercial or personal purposes. Likewise, schools who register on the "Pre:Loved Exchange" can enjoy a trusted source of good quality second-hand musical instruments at sympathetic prices.

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
- UI Alert messages for when a listing has been created, updated or deleted
- Contact us form failed
- Changing log in details (password, name) is nested into editing profile
- delete the listing from the database when it has been successfully purchased (stripe transaction successful)
- add purchased listing into the Purchase history of the school profile
- when an account is first created and the avatar image is uploaded, the image does not appear in the user_path view. The user has to edit their profile and re-upload the avatar image.

Overall the codebase is of amateur-quality.

Solutions to problems are naive, repetitive (not DRY) - at times near tautological - brought on by a lack of coding ability and a clear understanding of the Rails MVC framework. For example, to display different button functionalities for each type of user (un-logged in user, logged in user, logged in user who is also a school) on different parts of the website, the same control structure is repeated across multiple views.

```
<% if user_signed_in? && current_user.is_school? == true >
  ...
<% if user_signed_in? && current_user.is_school? == false%>
  ...
<% elsif user_signed_in? == false >
  ...

<% else %>
// rescue for unauthorised access
<% end %>
```

Some partials and centralised styling in `applications.scss` have been used in an attempt to consolidate and centralise some elements such as header, footer, forms, the card used to display each listing. However, the quality of the codebase and clunky user experience (i.e. Updating account authentication is nested a second level down from Editing Profile details) nonetheless demonstrated the haphazard, patchwork coding process of the solo developer. Maintaining the application as it is currently submitted will inevitably accrue compounding technical debt.

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
- Ruby-on-Rails for development
- RSpec for testing
- Heroku for deployment
- Rails Gems (see below) for extending functionalities beyond MVC

> Describe the network infrastructure the App may be based on.

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

> Describe the architecture of your App. Explain the different high-level components (abstractions) in your App.

### Instructions on Local Configuration

> Instructions on how to setup, configure and use your App.

---

### Project Plan & Design process

Please note that since this project was undertaken as a solo attempt, the development process did not exhibit the usual Git collaboration history, stand-up, agile or Kanban tracking as per the agile development methodology.

> Discuss how Agile methodology is being implemented in your project. Describe the way tasks are allocated and tracked in your project. Project Timeline.

| Sandbox Environment                                                                                       |                                         Example of Logging issues                                         |
| --------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/rachelwong/music/blob/master/readme_assets/screenshot_test.png" width="400"> | <img src="https://github.com/rachelwong/music/blob/master/readme_assets/thingsAttempted.png" width="400"> |

> Provide an overview and description of your Source control process.

---

### Workflow of User Stories

> Provide Wireframes for your App. Provide User Stories for your App

[See wireframes and workflows here](readme_assets/user_stories.md)

### Testing

> Provide an overview and description of your Testing process.

### Database Structure Entity Relationship Diagrams

> Discuss the database relations to be implemented. Describe your project’s models in terms of the relationships (active record associations) they have with each other.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/model_schema.png" width="700" />

> Provide your database schema design.

<img src="https://github.com/rachelwong/music/blob/master/readme_assets/databaseSchema.png" width="800" />

> Identify the database to be used in your App and provide a justification for your choice.

Rails by nature is database agnostic and will default to MySQL. However, **PostgreSQL** has been chosen for Pre:Loved due to the following:

- The deployment platform defined in the course is [Heroku](https://heroku.com), which uses PostgreSQL natively. While the [ClearDB add-on](https://devcenter.heroku.com/articles/cleardb) is available as a database-as-a-service to bridge MySQL to Heroku, implementing ClearDB will bring a additional learning commitment unachievable to an inexperienced developer flying solo in a compressed two-week timeframe.
- ACID (Atomicity, Consistency, Isolation, Durability) properties of PostgreSQL ensures no data is lost or miscommunicated across the system in the event of failure. This is particulary attractive as the application database holds private personal details of schools and individuals (addresses, emails, names).
- It's free and open source. Low start-up seeding required.
- CRUD performances and data validation are important priorities should Pre:Loved gain traction upon release in the real world. The database may then be required to handle growing amounts of private user information, listings data, with all its accompanying security concerns. MySQL is well suited for straightforward data transactions. However, PostgreSQL will _future-proof_ the application for more complex SQL query executions, faster data latency, read/write/retrieval performance optimisation and even open up avenues to business intelligence analytics.

> Identify and describe the production database setup (i.e. postgres instance).\*

### Security

> Discuss and analyse requirements related to information system security.

> Discuss methods you will use to protect information and data.

Development-wise, a configuration `.env` file was created at the root directory to store sensitive credentials (Api secret keys for Stripe and Cloudinary). This file is added to the `.gitignore` in the root directory so that when the codebase is pushed up to the github (and by extension to Heroku), the `.env` is exempt from the git push but the application can still refer to the credentials and run successfully. Upon deployment to heroku, the secret keys are provided to heroku in the terminal by the user as `heroku config:set STRIPE_SECRET_KEY=whateverthekeyis`.

The Figaro gem was installed but never used. It serves a similar function to .env, which generates instead an `appliation.yml˘ file instead.

The Devise gem helped with the secure authentication and field validation of user sign up and log in.

> Research what your legal obligations are in relation to handling user data.

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
