
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

#### Image resizing cheats

Resize to fixed size

```
mogrify -resize 64x64 *.png
```

```
convert 006.png -resize 150% 006-150.png
```

Tile image

```
convert -size 640x384 tile:background.png background-96.png
convert -size 1920x1152 tile:background.png background-96.png
```

Resize image up to given max

```
convert image.png -resize 1344x768\> result.png
```

```
convert slides/img/*.png -resize 1248x672\> -set filename:base "%[basename]" engine/src/static/images/oredev/slides/"%[filename:base].png"
```

```
convert *.png -resize 1248x672\> -set filename:base "%[basename]" "%[filename:base].png"
```

Add border

```
convert \
    \( crash-course-elm.jpg -resize 1248x672 -bordercolor none -gravity center -border 40x40 \) \
    \( -clone 0 -tile dirt.png -draw "color 0,0 reset" \) \
    +swap -compose over -composite crash-course-elm-border.jpg
```


#### Screen resolutions

Resolution is 1920x1080
96 = 20x11,25

max image sizes
14x8 = 1344x768
Misschien beter halve kleiner?
13x7 = 1248x672

Resolution is 1024x768
32 = 32x24
64 = 16x12

World one slide xoffset calculator
(width - 380) / 2 * -1


960 - height



convert \
    \( architecture.jpg -resize 1168x672 -bordercolor none -gravity center -border 40x40 \) \
    \( -clone 0 -tile dirt.png -draw "color 0,0 reset" \) \
    +swap -compose over -composite architecture-border.jpg