# PreLoved : A Ruby on Rails Two-Sided Marketplace

Live: https://secret-mountain-45294.herokuapp.com/

Codebase: https://github.com/rachelwong/music

---

## Purpose and Problem Definition

> What is the need (i.e. challenge) that you will be addressing in your project?

Queensland public and private primary and secondary schools have for years enjoyed a robust and comprehensive [musical and arts program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program) as part of their baseline education curriculum. More than 400 instrumental teachers and over 50,000 students are currently involved in Education Queensland's [Instrumental Music Program](https://education.qld.gov.au/parents-and-carers/activities-music-sports/instrumental-music-program). Students from grade 3 (age 7-8) to grade 12 (age 17-18) can learn to play band and orchestral instruments in small groups and participate in larger ensembles, such as concert bands and orchestras. For each school to support its own musical curriculum, it is encumbent upon the school's administration to set aside annual budgets to maintain existing inventory (i.e. the purchasing of replacement parts) and to acquire new instruments (i.e. brass, woodwind, percussion, strings) as needed to meet student demands.

> Identify the problem you’re trying to solve by building this particular marketplace App?

Although a [World Class Education -- Musical Instruments Funding Initiative](https://education.qld.gov.au/about-us/budgets-funding-grants/grants/state-schools/core-funding/world-class-education-musical-instruments) is run by the Queensland State Government to divide AUD$1 Million over a three-year period to state schools in major regions, orchestral and band instruments are largely provided on loan to schools. A casual survey of recent market prices revealed that new (student-range) instruments can easily run upwards from $700 (single string instruments) to several thousands (large percussion sets) [(see Music Express)](https://musicexpress.com.au/product-category/band-orchestral/cello/?orderby=price). Public listings such as [Gumtree](https://www.gumtree.com.au/s-musical-instruments/brisbane/c18409l3005721) do provide more affordable price ranges but condition, availability and authenticity are less assured. As migration and fertility rates continue to drive up Queensland's [above-national-average population growth](http://www.population.net.au/population-of-queensland/) since 2007, it is expected that all private and public schools in the state will experience high enrolment student intakes in the coming years.

The key challenge for the developer is to familiarise and understand the building, testing and deployment process on the Ruby-on-Rails framework.

> Why is it a problem that needs solving?

**For Queensland schools to deliver quality musical education in the face of growing student demands and high market prices, ready access to quality orchestral instruments at affordable rates is paramount.**

This assignment therefore seeks to improve access to quality musical instrument in Queensland schools by building \*\*a walled, two-sided marketplace "Pre:Loved" that allows verified private owners of second-hand musical instruments (i.e. parents of children who may have outgrown their instruments) to sell to primary and high schools at affordable prices.\*\*

> Describe the project you will be conducting and how your App will address the needs.

- This walled marketplace will shield pricing structure from the general public to service specifically [registered Queensland schools](https://schoolsdirectory.eq.edu.au/).
- Likewise, private seller details will be hidden from the public and only accessible by verified school accountholders.
- The marketplace does not welcome private individuals, only private owners of instruments willing to sell at compassionate below-market rates and verified schools.
- Only school account holders may purchase intruments on the site.
- Private sellers can only list instruments that abide by the marketplace's stringent grading policy on condition of the instrument.
- These measures provides a valuable, high-integrity marketplace environment promising both sellers and schools of trustworthy transactions in service of a worthy cause. On the one hand, private citizen sellers can be confident that their preloved musical instruments will go to school students in need, and not for commercial or personal purposes. Likewise, schools who register on the "Pre:Loved Exchange" can enjoy a trusted source of good quality second-hand musical instruments at sympathetic prices.

---

### Functionalities

MVP, Extensible

---

### Screenshots

---

### Tech Stack

- HTML, CSS#, SCSS for visual styling
- Heroku Deployment

> Identify and describe the software to be used in your App. Describe the network infrastructure the App may be based on.Detail any third party services that your App will use.

## Structure of App

> Describe the architecture of your App. Explain the different high-level components (abstractions) in your App.

### Instructions on Local Configuration

Instructions on how to setup, configure and use your App.

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

Rails by nature is database agnostic and will default to MySQL. However, \*PostgreSQL\* has been chosen for the following reasons:

- The deployment platform as defined in the course and assignment rubric is [Heroku](https://heroku.com), which uses PostgreSQL natively. While the [ClearDB add-on](https://devcenter.heroku.com/articles/cleardb) is available as a database-as-a-service to bridge MySQL with the Heroku platform, implementing ClearDB will add a additional learning commitment than the compressed two-week development cycle can afford for a single, inexperienced developer.
- ACID (Atomicity, Consistency, Isolation, Durability) properties of PostgreSQL ensures no data is lost or miscommunicated across the system in the event of failure. This is particulary attractive as this application's database holds private personal details of schools and private citizens.
- It's free and open source. Low start-up seeding required.
- CRUD performances and data validation are important priorities should the application gain traction with the school community. The database may be required to handle growing amounts of private user information, listing data, and all its accompanying security concerns.

MySQL is well suited for straightforward data transactions whereas using PostgreSQL will _future-proof_ the application for more complex query executions, faster data latency, read/write/retrieval performance optimisation and even open up avenues to business intelligence analytics.

- While

  > Identify and describe the production database setup (i.e. postgres instance).\*

### Security

> Discuss and analyse requirements related to information system security. Discuss methods you will use to protect information and data. Research what your legal obligations are in relation to handling user data.
