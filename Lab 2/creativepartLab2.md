# Features

- Pets can talk and make responses to your actions.
- Pets have levels and grow larger on level-up.

## Talks and Responses

![talks](/Users/wangziyi/Library/Mobile Documents/com~apple~CloudDocs/Files/WashU/courses/438 IOS/labs/lab2/talks.png)

### What

Each pet has its own unique talks! They greet you and make responses to your Play/Feed in totally different ways. Explore what your virtual firend will say to you!

### How

I implemented it by adding a label text area which links to an outlet in the code. I store their talks as a list in the class property. Whenever some action functions is called, it retrieves a certain sentance and display it on the screen.

### Why

This creative part shows the personalities of different pets, and makes the game more interesting to play. The users can get feedbacks from the pet so they get more emotionally involved .

## Level Up 

![levelup](/Users/wangziyi/Library/Mobile Documents/com~apple~CloudDocs/Files/WashU/courses/438 IOS/labs/lab2/levelup.png)

### What

The pet has a new property called Level. Through playing with and feeding them until the pet gets satisfied, which means both Happiness and Food Level reach 10, it will get a level-up. 

Different levels are reflected by different size of the pet image. When it gets a level-up, the pet will "grow" larger than before.

### How

I added the level as a new property in the pet class. A function named levelUp() is used to check if the pet satisfies the requirements and update its level. 

In the ViewController, the constraints of the pet image have outlets to alter the size of UIImageView according to the current level.

I restricted the max level to be 3.

### Why

This feature can serve as a motivation for the users to keep playing the game. Because it sets a clear goal as leveling up, and give stimulates through the pets' growing body as if you are really fostering a real pet.
