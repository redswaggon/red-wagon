# BIG QUESTIONS ABOUT LIKES.

1. What happens when 2 users like each other? How?

- IDEAL: Every mutual liker = you get a textbox which you can open (or close forever) and text at any point. Tinder sidebar.
- VIABLE BY MONDAY: 
- BASIC: Page to populate all wagon_ids of mutually liked wagon id's.

TODO:
1) Add Mutual Likes
2) Delete Wagons I like
3) Hide button
4) CSS
5) Deployment
6) Messaging service
7) MVPs and email exchange

FUTURE: How do we make sure users don't keep cycling repeats? What happens when a user has viewed all wagons? ==> if no wagons left, send them to like page with a rendered "You've viewed all the wagons! Want to see them all again?"


FORM TEXTBOX
rails g model messages
user has_many :messages
Attributes: content, from
