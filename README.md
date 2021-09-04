# lostship
Lost Ship Adventure for the TRS-80 with emulator. The file `lost.bas` contains the BASIC program for running the game. The other files form a web page that hosts the emulator and runs the game.
## History
I wrote this game originally in 1980 when I was 14 years old. I really enjoyed the Scott Adams (not the Dilbert guy, a different Scott Adams) text adventures. Like many other kids my age, I decided to write my own game in the same genre, so I began writing Lost Ship Adventure at the end of the school year.

The TRS-80 Users Group of Eastern Massachusetts (TRUGEM) met at my school and I attended every meeting. One evening, a man named Bob Liddil came to the meeting. He had a small software publishing company called "The Programmer's Guild." He was also well-known for writing a column about games under the name "Captain 80." My friends and I showed him the games we were working on. He gave us feedback and to me that "When you finish that, I can sell it."

Obviously, I was excited by this idea so I spend a couple months of my summer vacation working on it. I sent him the finished program and he did, in fact sell it.

Since then, it has floated around in archived format. There appear to be three versions: one was sold on cassette. It had the "animated" intro screen (which I've restored and updated) and a cassette-based save game routine. The second was the disk version which did not have the banner, but did have a disk-based save. The third version was in a listing in Captain 80's Book of Adventures. All had modifications (such as the animated screen) that I did not code.

## Version 4
This is about what I've done to it in 2021.

### Getting the Damned Thing to Run
When my friend Harry decided to ressurect his game, Arctic Adventure, from the listing in the Captain 80 book, I became interested in doing the same with Lost Ship Adventure. I managed to get most of it working before finding complete copies of the original on the web. The web versions had a problem: they were so hacked that only the most faithful emulators could run them. The web emulator could not.

One of my obsessions was to replicate the split-screen scrolling feature from the Scott Adams games. Adams' games were written in machine code so he could implement whatever screen output he wanted. There was no way to tell BASIC to scroll only part of the screen, so I came up with a hack: a small machine language routine. BASIC had a feature that allowed the code to call a binary routine, so I used that. All I needed was a place to put the short 11-byte piece of code. In order to do that, I created a string with ample space, got the address of the string, and POKE'ed the bytes in. After I'd done that I would save the program and the modified string would be written out.

This didn't work in a listing, nor is it working for some of the emulators. You can't rely on the code being parse. The Captain 80 book had the solution: it included BASIC code to POKE the machine code in every time the program was run. My first fix to the archived code was to remove the "weird" string from the code, and include the "set it up every time" code. For some reason the person who added this to the listing version had the program run once, alter itself, and then delete the alteration code and tell you to run it again. This was... efficient? ...but I got rid of it.

### Fixing the Plot
As it turns out, a couple of weeks before I began playing with this old program, someone published a new review of it. The review was pretty nice, but it pointed out a couple of this. 

First, there was a hidden deck on the ship with no logical way to get to it. Of course, getting to this deck was part of the puzzle, but the reviewer pointed out that without *any* other way of getting there, the crew of the ship would have had a hell of a time operating the ship. It was a small item, but it bugged me so I put some stuff in to show a "normal" way to get to the deck, but make it so that you couldn't use that method.

The second criticism was that the story starts out in an interesting world that captures your imagination and then becomes rather dull and ends abruptly. This was an artifact of how the game was created. I began writing the game for my own enjoyment and only expected my school friends to actually play it. For example, the manatee (which also shows up in Dragonquest Adventure) was an in-joke from my high-school friends. The game did not have any kind of overarching plot. The story takes you to an island where things just kind of happen and nothing is really connected. Although the player is expecting it to lead to something, it doesn't. I just wrote until I ran out of ideas.

This isn't the worst approach; JJ Abrams made a hit television show doing the same thing. Stil, I needed a more satisfying ending. I contemplated a few ideas. You discover a lost temple? Too involved. Smoke monster? Too stupid. Hopefully you'll far enough to find what I did. I'm pretty happy with it.

Finally, Harry suggested that we somehow link Arctic Adventure and Lost Ship Adventure. We decided that somehow, the SS. Deathflower managed to sail to the Artic where it was wrecked. Now the two games reference this. I think this will go on to become a massive shared universe in the realm of TRS-80 BASIC adventure games.

### Code Changes
The original game featured text that would visibly write letter-by letter. Some people liked this. There were two reasons for it.

The first reason is that I packed all of the data about objects into a single string. The format separated the object "name" (e.g. Jewelled Dagger) from the object detailed description in the same string using an asterix character. While BASIC had a nice MID$ function that could lift these sections out of the packed string, *there was no function to find the index of the delimiter!* For that reason, I had to have `FOR` loops find the delimiter. As I was looping through, I might as well print the characters, right?

The other reason was scrolling. When printing in the scrollable region, I had to "manually" scroll. This mean not printing anything at the end of the line where BASIC would scroll it automatically. Thus, if I had a long piece of text to print, I had to do my own line wrapping, so printing out one character at a time allowed me to manually scroll when I got to close to the end of the line.

In the new version, I go ahead and use MID$ to extract the strings. I also created a subroutine that recursively prints text with line breaks at spaces between words. I think I used recursion in later TRS-80 programs written in assembler, but it was just so hard to do in BASIC because all variable are global.

I hope nobody misses the characters crawling onto the screen.

I fixed a few bugs. For example, EXAMINE-ing objects sometimes has side effects. The original code will perform those side effects even if the item is not around. Later, when you encountered the item, it would have already been transformed. The code is much better at enforcing world logic now, but maybe not perfect.

I improved a lot of the messaging. I think that I was following the terse style of the Scott Adams adventures, but I think it adds a lot to have richer responses.

The save/load game has been removed since it doesn't work in the emulator. I may change this to be an "in-memory" savepoint so you don't have to replay from the start if you die. I've changed enough I'd have to redo the save logic anyway.
