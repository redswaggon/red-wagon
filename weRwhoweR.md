# BIG QUESTIONS ABOUT LIKES.

1. What happens when 2 users like each other? How?

- IDEAL: Every mutual liker = you get a textbox which you can open (or close forever) and text at any point. Tinder sidebar.
- VIABLE BY MONDAY: 
- BASIC: Page to populate all wagon_ids of mutually liked wagon id's.

WAYS OF DEALING WITH STORING AND/OR DISPLAYING MUTUAL LIKES:

Like.where(user_id: @user.id)

\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

2) How do we make sure users don't keep cycling repeats? What happens when a user has viewed all wagons? ==> if no wagons left, send them to like page with a rendered "You've viewed all the wagons! Want to see them all again?"