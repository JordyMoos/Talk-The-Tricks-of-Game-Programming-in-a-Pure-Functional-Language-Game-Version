
# Setup

- [ ] Open hotspot
- [ ] Start the game engine
`cd engine/dist`
`python3 -m http.server 3000`

### Open games

```
http://localhost:3000/?startLevel=oredev/official-001-in-pixel&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&lazy=1
```

### Backup games

```
http://localhost:3000/?startLevel=oredev/official-001-with-cheats&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&lazy=1
```

```
http://localhost:3000/?startLevel=oredev/world-1&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&lazy=1
```

```
http://localhost:3000/?startLevel=oredev/world-2&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&lazy=1
```

```
http://localhost:8001/?startLevel=talk/game-loop-walking-3&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&lazy=1
```

```
http://localhost:8001/?startLevel=test/game-of-life&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&width=20&height=16&lazy=1
```

```
http://localhost:8001/?startLevel=advent/official&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&width=25&height=25&lazy=1
```

```
http://localhost:8001/?startLevel=talk/optimization-1&hideDebug=1&hideControls=1&hideEdit=1&additionalViewBorder=10&lazy=1
```

```
http://localhost:8002/?startLevel=official/001&hideDebug=1&hideControls=1&hideEdit=1&lazy=1
```

```
http://localhost:8003/?startLevel=official/001&hideDebug=1&hideControls=1&hideEdit=1&lazy=1
```

```
http://localhost:8004/?startLevel=official/001&hideDebug=1&hideControls=1&hideEdit=1&lazy=1
```


### Open editor Elm Pixel Boulder Game

Then open file "LevelUpdate.elm"

Make sure font is big


### Develop

#### Create production version of the engine

`cd engine`
`npm install`
`npm run prod`
