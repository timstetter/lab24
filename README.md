# lab24
Party Site - lab 24
LAB NUMBER: 24 (PART 1)
Task: Create a pizza party planner website. It allows participants to vote on pizza options and
allows hosts to review the guests’ votes. Use JPA and Hibernate to store the pizza options and
votes in a database.
Skills: JPA/Hibernate, Query, Create, Update
What will the application do?
● Homepage:
○ Displays a list or HTML table of parties from the database, including the name
and date of each.
■ Note: For this part of the lab, there is no way for a user to modify this list.
■ Note: <fmt:formatDate> will not work with LocalDate so leave the date
unformatted for now.
○ Links to two other pages: the vote page and the review page.
● Vote page:
○ Displays an HTML table of pizzas to choose from. The table has headings:
Name , Description , and Votes .
○ Each row in the table displays a number of votes for that pizza. It also includes a
button or link to add your vote to that pizza. Clicking this button/link adds one
vote and immediately redirects back to the vote page.
○ At the bottom is a form to add a new pizza option. The user can fill in the pizza
name and description. Submitting this form adds the pizza to this list, starting
with zero votes, and immediately redirects back to the vote page.
● Review page:
○ Displays an HTML table of the pizza options with their votes. It has headings:
Name , Description , and Votes . This page does not have a way to add votes.
○ The pizzas in this table are sorted from most to least votes.
○ This table does not show pizzas that have no (0) votes.
Build Specifications
● Create a Party POJO with these fields: id (Long), name (String), date (LocalDate).
● Create a PartyOption POJO with these fields: id (Long), name (String), description
(String), and votes (Integer).
● Create database tables to match these POJOs. Add some sample parties and pizza
options to the database using MySQL Workbench.
Extended Challenges
1. Implement the ability to edit an option. For each pizza in the votes table, add a link to
an edit page. The edit page displays a form that is pre-populated with the name and
description of the selected pizza. When the form is saved, the name and description
are updated in the database and the user is redirected back to the votes page.
48
2. Add categories (e.g. sides, drinks). Add a “type” field to the PartyOption POJO and
corresponding SQL table. Modify the add form with an input for the type. On the vote
screen, instead of just one table, display multiple tables (one per type). You can
hard-code the available types.
3. <fmt:formatDate> will not work directly with LocalDate, but there are solutions to format
the date. Do some research and display party dates in a format you like.
Example Screenshots
Homepage:
Vote Page:
Review Page:
EXTENDED CHALLENGE: Categories
49
LAB NUMBER: 24 (PART 2)
Task: Add ability to search for parties. Add a party administration page, where a user can add,
remove, and edit parties.
Skills: JPA/Hibernate, Querying, CRUD
What will the application do?
● Homepage:
○ Add a search form to the top of the page. It has a field for name. It submits back
to the homepage.
○ When the search form is submitted use JPA/Hibernate queries to limit the
parties shown based on the name. If name is not blank, only include parties that
contain the input value somewhere in their name.
● Administration page:
○ Add a new page that lists all the parties, sorted by date, with the latest first.
○ Add a link at the bottom that leads to a page with a form for filling in a name
and date to create a new party. You decide if you want a confirmation page or if
you want to redirect back to the admin page on submission.
○ For each party include an edit link and a delete link.
■ The edit link leads to another page with a form that is pre-populated with
the name and date of the selected party. The user can modify these
fields and submit the form to update the database. You decide if you
want a confirmation page or if you want to redirect back to the admin
page on submission.
■ The delete link immediately removes the specified party from the
database. You decide if you want a confirmation page or if you want to
redirect back to the admin page on submission.
○ On the homepage, add a link to the administration page.
Hints
● For Spring to bind the date input from your form, add this annotation to the date field
of the Party POJO: @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
Extended Challenges
1. In the search form on the homepage, add radio buttons for “all time”, “future only”, and
“past only”.
a. If “future only” is selected, only include parties that are today or after.
b. If “past only” is selected, only include parties that are today or before.
c. If “all time” is selected, the search is unaffected.
d. Allow a combination of both name and date criteria.
2. Give the user the option of how to sort the parties on the homepage. e.g. by name, by
date ascending, by date descending.
50
Example Screenshots
Homepage:
EXTENDED CHALLENGE: Homepage date filter
Admin page:
Admin add form:
Admin edit form:
51
LAB NUMBER: 24 (PART 3)
Task: Add RSVPs to parties.
Skills: JPA/Hibernate Many-to-One Relationships
What will the application do?
● On the homepage, users can add RSVPs for particular parties. RSVPs include the name
of the attendee and a comment.
● Each party listed on the homepage displays the number of associated RSVPs.
● Each party listed on the homepage also has a link to a detail page for that party. The
detail page shows the party name and date and lists the RSVPs for that party.
Build specifications
● Create an Rsvp POJO with these fields: id (Long), attendee (String), comment (String),
party (Party). The party field is a many-to-one relationship to Party.
● Modify the Party POJO to add this field: rsvps (Set<Rsvp>). The rsvps field is the other
side of the relationship.
● Create and modify database tables as necessary to match these POJOs. Add some
sample Rsvps to the database using MySQL Workbench.
● Add a form to the homepage where users can add RSVPs by selecting the party from a
<select> and filling in the attendee and comment. When the form is submitted, an Rsvp
is added and the user is redirected back to the homepage.
● Add the count of RSVPs to each party on the homepage. Also add a link to a details
page for that party.
● On the party details page, display the party name, date, and a list of RSVPs, including
the attendee and comment. Also in the navigation include a link back to the homepage.
Extended Challenges:
1. Add the ability to delete an RSVP.
2. Include an auto-generated timestamp field on RSVP. Display this on the party detail
page and use it to sort the RSVPs.
52
Example Screenshots: (Yours may look different depending what extended challenges you've
included.)
Homepage:
Party Details Page:
53
LAB NUMBER: 24 (PART 4)
Task: Add categories to parties.
Skills: JPA/Hibernate Many-to-Many Relationships
What will the application do?
● There is a list of categories in the database. This list does not need to be editable on
the website.
● Each party can have any number of these categories. On the homepage, each party
displays all of its categories.
● The party detail page also displays a list of the categories for that party.
● On the party detail page, categories can be added from a dropdown in a form. On
submission return back to the same party details page.
Build specifications
● Modify the Party POJO to add this field: categories (Set<Category>). The categories
field is a many-to-many relationship to Category.
● Create a Category POJO with these fields: id (Long), name (String), parties
(Set<Party>). The parties field is the other side of the many-to-many relationship.
● Create and modify database tables as necessary to match these POJOs. Add some
categories.
● Add a form to the party details page where users can select and add categories. When
the form is submitted, the category is added to the party and the user is redirected
back to the same party details page.
● Add a list of associated categories to the party details page.
● Add a list of associated categories to each party listed on the homepage.
Extended Challenges:
1. Add the ability to remove a category from a party.
2. On the homepage, add the ability to filter the party list by choosing a category.
3. Add the ability to add new categories to the database.
54
Example Screenshots: (Yours may look different depending what extended challenges you've
included.)
Homepage:
Party Details Page:
55
LAB NUMBER: 24 (PART 5)
Task: Add a relationship between party and pizza option. Users can now visit a vote page for a
particular party to vote.
Skills: JPA/Hibernate Relationships
What will the application do?
● The vote and review pages work just as before, but now they require a URL query
parameter (or optionally a path variable instead) to specify the ID of the party the
options and votes are for.
● When voting or adding an option the user is returned back to the vote page for the
correct party ID.
● Each party listed on the homepage has a vote link and a review link for that particular
party.
● The vote page has a link to the review page for that party ID, and the review page has a
link to the vote page.
Build specifications
● Modify the PartyOption POJO to add a relationship to Party (one party can have many
party options). You will need to update your database as well. It’s probably easiest to
drop your old tables and recreate them.
● Update the vote page to require a party parameter (or path variable) with the party ID
and only display options related to that party.
● Update the add an option functionality to ensure the option gets related to the correct
party when added. Once added, redirect back to the vote page with the correct party
ID.
● Update the vote functionality to redirect back to the vote page with the correct party ID.
● Update the review page to require a party parameter (or path variable) with the party ID
and only display options related to that party.
● Ensure links on vote and review pages navigate between the two pages passing the
correct party ID.
Extended Challenges: Consider extended challenges from parts one and two that you have
not done yet.
56
Example Screenshots: (Yours may look different depending what extended challenges you've
included.)
Homepage:
Voting page (for Launch Party):
Review page (for Launch Party):
57
