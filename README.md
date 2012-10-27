```
  ______  ___      _____
  ___   |/  /_____ __  /_______________
  __  /|_/ / _  _ \_  __/__  ___/_  __ \
  _  /  / /  /  __// /_  _  /    / /_/ /
  /_/  /_/   \___/ \__/  /_/     \____/

```
# metro

Metro is a framework built around [gosu](https://github.com/jlnr/gosu) (the 2D game development library in Ruby). The goal of Metro is to enforce common conceptual structures and conventions making it easier to quickly generate a game.

> NOTE: This project is very early in development and at this point mostly a prototype to explore more of theses concepts to gain an understanding of core tools necessary to make games.

## Installation

    $ gem install metro

## Usage

### Running a Game

By default `metro` will look for a file named 'metro' within the current working directory if no *gamefilename* has been provided.

```
metro [gamefilename]
```

Please take a look at the [example game project](https://github.com/burtlo/starry-knight) that is being built alongside of 'metro'. It currently showcases all the current features available to the game.

```bash
$ git clone git://github.com/burtlo/starry-knight.git
$ cd starry-knight
$ metro
```

### Creating a Game

Metro contains content generators to assist you.

Creating a Game can be done with a single command.

```bash
$ metro new GAMENAME
```

This should generate for you a starting game with a branding scene and a title scene. The game allows the player to start the game.

The game is missing the `first` scene of the game. This can be created with the scene generator:

```bash
$ metro generate scene first
```

This should generate a scene in the scenes directory. The scene file contains a lot of examples of how to draw, animate and have your scene listen to events.
