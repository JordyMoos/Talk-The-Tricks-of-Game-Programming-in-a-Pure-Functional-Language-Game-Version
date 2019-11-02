
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



world 2

total w: 1909
width: 1202
offset: 353

(1909-1202) / 2


convert \
    \( architecture.jpg -resize 1168x672 -bordercolor none -gravity center -border 40x40 \) \
    \( -clone 0 -tile dirt.png -draw "color 0,0 reset" \) \
    +swap -compose over -composite architecture-border.jpg
    
    
convert elm-actor-component-4.png -bordercolor "#2b2b2b" -border 20 elm-actor-component-4.png

