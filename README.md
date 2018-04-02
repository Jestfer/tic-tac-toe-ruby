Tic Tac Toe
=================

## Description
Tic Tac Toe Tech Test

## User Stories
```
As a hard-worker
So that I can take a break and de-stress
I want to play Tic Tac Toe with a colleague

As a competitive hard-worker
So that I can see who is the best player
I want the game to declare a winner
```

## My approach

* First, I worked on the Domain Modelling for this CL app, focusing on how many classes I would need and what is the responsibility for each of them.

* After that, and to design the app, I worked on branching the methods each class would have and what are their tasks, assuring each method performs only one task (this was a top priority for me in this exercise).

* TDD: I started working on a class at a time, creating unit tests first for each one of them.

## Next focus

* Probably the top priority would be to refactor the game_over private method. It seems a bit too big for me, but due to the way I organised the game logic, it is kind of the central method that controls if there is a next turn or not, and also determines if a player won or if there was a draw. Also, it triggers the end_game method, which sets the game instance @finished property to 'true', in order to raise an exception if the next player wants to claim a field once he lost the game.

* I would like to investigate further on how to create a test that plays random games, based on random choices. This way, I can really test if the win_conditions are well set up. The way I would probably do this is:
- Setting up an array of numbers ([1-9]) and, then, iterate through them, choosing a random number and deleting that number from the array after each iteration.

* Finally, I could not find a way to merge lines 28 and 29 together in one (where I check if a win condition has all X's or O's). I would like to research how to do this, as I am aware this is not optiomal (related to the first point on this section)

## Conclusion

* I am satisfied overall with the outcome of my logic for this exercise. I think it is solid and shows an improvement compared to the last few weeks. I had in mind separation of concerns at all times, but SRP can be improved, I am aware. Sometimes it feels like my methods do a lot.

* When I have some time, I will guide my refactoring using complexity metrics with the flog gem.

## Screenshots
![Screenshot 1](/images/sc-1.png?raw=true)
![Screenshot 2](/images/sc-2.png?raw=true)
