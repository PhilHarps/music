# PreLoved : A study in developing on Ruby-on-Rails

https://secret-mountain-45294.herokuapp.com/

Codebase: https://github.com/rachelwong/music

---

## Defining Purpose and Problem

> What is the need (i.e. challenge) that you will be addressing in your project?

Queensland public and private primary and secondary schools have for years enjoyed a robust and comprehensive [musical and arts program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program) as part of their baseline education curriculum. More than 400 instrumental teachers and over 50,000 students are currently involved in Education Queensland's [Instrumental Music Program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program). Students from grade 3 (age 7-8) to grade 12 (age 17-18) can learn to play band and orchestral instruments (brass, woodwind, percussion, strings) in small groups and participate in larger ensembles, such as concert bands and orchestras.

While each school's musical curriculum may vary in size, it is encumbent upon each school's administration to set aside sufficient annual budgetary allowances to maintain existing inventory (i.e. purchasing replacement parts like woodwind reeds and violin strings) and to acquire new instruments as needed to meet student demands.

> Identify the problem you’re trying to solve by building this particular marketplace App?

The Queensland state government currently sponsors a [World Class Education -- Musical Instruments Funding Initiative](https://education.qld.gov.au/about-us/budgets-funding-grants/grants/state-schools/core-funding/world-class-education-musical-instruments) that dispenses AUD$1 Million over a three-year period to registered state schools in major regions. Nonetheless, by and large orchestral and band musical instruments are largely provided on loan to schools. A casual survey of recent market prices revealed brand-new, student range acoustic instruments can easily run upwards from $700 (single string instruments) to several thousands (large percussion sets) [(see Music Express)](https://musicexpress.com.au/product-category/band-orchestral/cello/?orderby=price). Public listings such as [Gumtree](https://www.gumtree.com.au/s-musical-instruments/brisbane/c18409l3005721) do provide more affordable price ranges but condition, availability and authenticity are less assured. As migration and fertility rates continue to drive up Queensland's [above-national-average population growth](http://www.population.net.au/population-of-queensland/) since 2007, it is expected that all private and public schools in the state will continue to experience high enrolment student intakes in the coming years.

On the other side of the equation, the key challenge for the developer to solve is to learn and understand the building, testing and deployment processes to deliver an operational product using Ruby-on-Rails.

> Why is it a problem that needs solving?

**For Queensland schools to deliver quality musical education in the face of growing student demands and high market prices, ready access to quality orchestral instruments at affordable rates is paramount.**

This assignment therefore seeks to improve access to quality musical instrument in Queensland schools by building \*a walled, two-sided marketplace "Pre:Loved" that allows verified private owners of second-hand musical instruments (i.e. parents of children who may have outgrown their instruments) to sell to primary and high schools at affordable prices.\*

The only comparable Australian marketplace that seeks to achieve a similar aim is [Gift of Music](https://www.giftofmusic.org.au/), a non-profit drive helping rural and disadvantaged children gain access to musical instruments through volunteer donations. There appears to be no public listings of instruments available, operating only via private correspondence in their contact form.

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

Due to lack of coding experience and knowledge on Ruby-on-Rails, the developer only aimed to achieve MVP functionalities, which include:

- User account log-in, log-out through [Devise gem](https://github.com/plataformatec/devise)
- User can CRUD own profile, including uploading an avatar image
- User can upload listings, which they can manage (edit, view, delete) from their profile
- Basic Search through all listings

---

### Unresolved Problems

- Search bar on the home page is case sensitive, and only searches for words within the `description` field of the listing.

---

### Extensible Features

---

### Screenshots

---

### Tech Stack

- HTML, CSS#, SCSS for visual styling
- Heroku Deployment

> Identify and describe the software to be used in your App. Describe the network infrastructure the App may be based on.Detail any third party services that your App will use.

#### Gem Dependencies

| Gem                                                                                         | What I achieved with it                                                                                                                                                    |
| ------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Devise](https://github.com/plataformatec/devise)                                           | User authentication (log-in, log-out, edit profile) for `@seller` and `@user` user types                                                                                   |
| [Dotenv 2.1.1](https://rubygems.org/gems/dotenv-rails/versions/2.1.1)                       | Installed to load environment variables from .env in test and development environments.                                                                                    |
| [Kaminari](https://github.com/kaminari/kaminari)                                            | Page paginatio for "View All Listings" and Search results pages                                                                                                            |
| [Cloudinary](https://github.com/cloudinary/cloudinary_gem)                                  | Works with activestorage-cloudinary-service gem to configure the heroku app with an account on Cloudinary to host images and file uploads                                  |
| [Figaro](https://github.com/laserlemon/figaro)                                              | Implemented with the original intention to hide sensitive credentials such as private API keys for Stripe and Cloudinary. In the end, opted for using `.env` file instead. |
| [Stripe](https://github.com/stripe/stripe-ruby)                                             | Implemented a single-item purchase transaction. Fully deployed on heroku.                                                                                                  |
| [activestorage-cloudinary-service](https://github.com/0sc/activestorage-cloudinary-service) | Works with Cloudinary gem to configure the heroku app with an account on Cloudinary to host images and file uploads                                                        |

### Structure of App

> Describe the architecture of your App. Explain the different high-level components (abstractions) in your App.

### Instructions on Local Configuration

> Instructions on how to setup, configure and use your App.

---

### Project Plan & Design process

> Discuss how Agile methodology is being implemented in your project. Describe the way tasks are allocated and tracked in your project. Project Timeline. Provide an overview and description of your Source control process.

---

### Workflow of User Stories

> Provide Wireframes for your App. Provide User Stories for your App

---

### Testing

> Provide an overview and description of your Testing process.

### Database Structure Entity Relationship Diagrams

> Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

> Discuss the database relations to be implemented. Describe your project’s models in terms of the relationships (active record associations) they have with each other.

> Provide your database schema design.

> Identify the database to be used in your App and provide a justification for your choice.

Rails by nature is database agnostic and will default to MySQL. However, PostgreSQL has been chosen for "Pre:Loved" due to the following:

- The deployment platform defined in the course is [Heroku](https://heroku.com), which uses PostgreSQL natively. While the [ClearDB add-on](https://devcenter.heroku.com/articles/cleardb) is available as a database-as-a-service to bridge MySQL to Heroku, implementing ClearDB will bring a additional learning commitment unachievable to the compressed two-week development cycle for a single, inexperienced developer.
- ACID (Atomicity, Consistency, Isolation, Durability) properties of PostgreSQL ensures no data is lost or miscommunicated across the system in the event of failure. This is particulary attractive as this application's database holds private personal details of schools and private citizens (addresses, emails, names).
- It's free and open source. Low start-up seeding required.
- CRUD performances and data validation are important priorities should "Pre:Loved" gain traction with the school community. The database may be required to handle growing amounts of private user information, listings data, and all its accompanying security concerns. MySQL is well suited for straightforward data transactions. However, PostgreSQL will _future-proof_ the application for more complex query executions, faster data latency, read/write/retrieval performance optimisation and even open up avenues to business intelligence analytics.
- While

  > Identify and describe the production database setup (i.e. postgres instance).\*

### Security

> Discuss and analyse requirements related to information system security. Discuss methods you will use to protect information and data.

> Research what your legal obligations are in relation to handling user data.
