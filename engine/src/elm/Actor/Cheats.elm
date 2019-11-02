module Actor.Cheats exposing (addBigExplosion)

import Actor.Actor
    exposing
        ( Component(..)
        , Entities
        , Level
        , LifetimeAction(..)
        , RenderComponentData
        , RenderType(..)
        )
import Actor.Common as Common
import Data.Direction as Direction exposing (Direction)
import Data.Position as Position exposing (Position)
import Dict


addExplosion : Entities -> String -> Int -> Int -> Level -> Level
addExplosion entities entityName x y level =
    Dict.get
        entityName
        entities
        |> Maybe.map
            (\entity ->
                Common.addActor
                    (Dict.insert
                        "transform"
                        (TransformComponent { position = { x = x, y = y } })
                        entity
                    )
                    level
            )
        |> Maybe.withDefault level


addBigExplosion : Entities -> String -> Position -> Level -> Level
addBigExplosion entities entityName position level =
    List.foldr
        (\pos lev ->
            lev |> addExplosion entities entityName pos.x pos.y
        )
        level
        [ Position.addPositions [ position, Position.getOffsetFromDirection Direction.Left, Position.getOffsetFromDirection Direction.Up ]
        , Position.addPositions [ position, Position.getOffsetFromDirection Direction.Up ]
        , Position.addPositions [ position, Position.getOffsetFromDirection Direction.Right, Position.getOffsetFromDirection Direction.Up ]
        , Position.addPositions [ position, Position.getOffsetFromDirection Direction.Left ]
        , position
        , Position.addPositions [ position, Position.getOffsetFromDirection Direction.Right ]
        , Position.addPositions [ position, Position.getOffsetFromDirection Direction.Left, Position.getOffsetFromDirection Direction.Down ]
        , Position.addPositions [ position, Position.getOffsetFromDirection Direction.Down ]
        , Position.addPositions [ position, Position.getOffsetFromDirection Direction.Right, Position.getOffsetFromDirection Direction.Down ]
        ]
