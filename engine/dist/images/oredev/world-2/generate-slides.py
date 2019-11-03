import json
import os
import math
from PIL import Image
from collections import OrderedDict


files = ["movie-scene-border.png"
    , "actor-scene-1-border.png"
    , "actor-scene-2-border.png"
    , "time-border.png"
    , "game-loop-1-border.png"
    , "game-loop-2-border.png"
    , "game-loop-3-border.png"
    , "game-loop-4-border.png"
    , "game-loop-5-border.png"
    , "elm-game-loop-1-border.png"
    , "elm-game-loop-2-border.png"
    , "elm-game-loop-3-border.png"
    , "elm-game-loop-4-border.png"
    , "elm-game-loop-5-border.png"
    , "elm-game-loop-6-border.png"
    , "goto-actors-border.png"
    , "actor-component-1-border.png"
    , "actor-component-2-border.png"
    , "actor-component-3-border.png"
    , "actor-component-4-border.png"
    , "actor-component-5-border.png"
    , "actor-component-6-border.png"
    , "composition-over-inheritance-border.png"
    , "elm-actor-component-1-border.png"
    , "elm-actor-component-2-border.png"
    , "elm-actor-component-3-border.png"
    , "elm-actor-component-4-border.png"
    , "goto-implementing-behaviour-border.png"
    , "elm-component-implementation-1-border.png"
    , "elm-component-implementation-2-border.png"
    , "elm-component-implementation-3-border.png"
    , "elm-component-implementation-4-border.png"
    , "elm-component-implementation-5-border.png"
    , "elm-component-implementation-6-border.png"
    , "elm-component-implementation-7-border.png"
    , "elm-component-implementation-8-border.png"
    , "elm-component-implementation-9-border.png"
    , "level-update-border.png"
    , "demo-border.png"
    , "demo-move-more-border.png"
    , "demo-move-all-border.png"
    , "demo-gol-border.png"
    , "demo-advent-border.png"
    , "advent-answer-border.png"
    , "goto-serialization-border.png"
    , "serialization-1-border.png"
    , "serialization-2-border.png"
    , "serialization-3-border.png"
    , "serialization-4-border.png"
    , "serialization-5-border.png"
    , "goto-rendering-border.png"
    , "ascii-canvas-border.png"
    , "svg-border.png"
    , "renderer-1-border.png"
    , "renderer-2-border.png"
    , "renderer-3-border.png"
    , "4th-renderer-border.png"
    , "renderer-4-border.png"
    , "renderer-5-border.png"
    , "demo-vr-border.png"
    , "demo-ar-border.png"
    , "demo-3d-border.png"
    , "goto-performance-border.png"
    ]
print("\n")

actors = {}
images = {}
signs = {}
scenes = []
trigger_actors = {}
trigger_signs = {}

counter = 0
for image in files:
    counter = counter + 1
    name = image.replace("-border.png", "")
    actor_name = "slide-" + name
    sign = "S%02d" % counter
    trigger_key = "T%02d" % counter
    trigger_name = "trigger-%02d" % counter
    (image_width, image_height) = Image.open(image).size
    xOffset = math.floor((1909 - image_width) / 2)
    yOffset = -227

    # Add to actors
    actors[actor_name] = [{
        "type": "render"
        , "data": {
            "renderType": {
                "type": "image"
                ,  "data": {
                    "default": {
                        "names": [
                            name
                        ]
                    }
                }
            }
            , "layer": 20
        }
    }]

    # Add to signs
    signs[sign] = actor_name

    # Add to the images
    images[name] = { "path": "./images/oredev/world-2/" + image
        , "width": image_width
        , "height": image_height
        , "xOffset": xOffset
        , "yOffset": yOffset }

    # Add to the scene
    scenes.append(
        [
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "      %s                                                               " % sign,
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "                                                                        ",
              "%s                                                                     " % trigger_key,
              "                                                                        ",
              "                                                                        "
            ]
    )

    trigger_actors[trigger_name] = [{
        "type": "trigger",
        "data": {
            "action": {
                "type": "send-text",
                "data": {
                    "message": ""
                }
            }
        }
    }]
    trigger_signs[trigger_key] = trigger_name



print("\n\n\n")
print(json.dumps(OrderedDict(sorted(actors.items()))))
print("\n\n\n")
print(json.dumps(OrderedDict(sorted(signs.items()))))
print("\n\n\n")
print(json.dumps(OrderedDict(sorted(images.items()))))
print("\n\n\n")
print(json.dumps(scenes))
print("\n\n\n")
print(json.dumps(OrderedDict(sorted(trigger_actors.items()))))
print("\n\n\n")
print(json.dumps(OrderedDict(sorted(trigger_signs.items()))))
print("\n\n\n")