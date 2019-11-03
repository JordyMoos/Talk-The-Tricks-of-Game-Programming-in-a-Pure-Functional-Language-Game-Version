
# Setup

- [ ] Open hotspot

- [ ] Start speaker notes
```
cd speaker-notes
python3.6 echo.py
```

- [ ] Start the game engine
```
cd engine/dist
python3.6 -m http.server 3000
```

- [ ] Alternative engines
```
cd demos/3001-vr
python3.6 -m http.server 3001
```

```
cd demos/3002-ar
python3.6 -m http.server 3002
```

```
cd demos/3003-3d
python3.6 -m http.server 3003
```

- [ ] Open editor with the "LevelUpdate.elm"
- [ ] Make sure the editor has big font

- [ ] Open the narrow actor demo as the first tab

```
http://localhost:3000/?startLevel=oredev/demo/update-border&hideDebug=1&hideControls=1&hideControls=1&hideEdit=1&lazy=1

```

- [ ] Start the slides
```
cd slides
npm start
```

### Develop

#### Create production version of the engine

`cd engine`
`npm install`
`npm run prod`
