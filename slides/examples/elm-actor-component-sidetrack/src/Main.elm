module Main exposing (main)

import Browser
import Browser.Events
import Html exposing (Html, text)
import Browser.Events

type alias Game =
    { level : Level
    }

type alias Level =
    { actors : List Actor
    }


type alias Model =
    { timeBuffer : Int
    , game : Game
    }


initialModel : Model
initialModel =
    { timeBuffer = 0
    , game =
      { level =
        { actors = []
        }
      }
    }


type Msg
    = Tick Float

subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onAnimationFrameDelta Tick

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Tick timeSinceLast ->
            handleTick model (round timeSinceLast)
                |> updateTimeBuffer timeSinceLast
                |> (\updatedModel -> (updatedModel, Cmd.none))


updateNaive : Msg -> Model -> Model
updateNaive msg model =
    case msg of
        Tick timeSinceLast ->
            handleTick model (round timeSinceLast)


handleTick : Model -> Int -> Model
handleTick model timeSinceLast =
    let
        tickCount = ((model.timeBuffer + timeSinceLast) // 17)
    in
    List.repeat tickCount ()
        |> List.take 5      -- Limit updates before "forced" redraw
        |> List.foldl
            (\_ accModel ->
                updateGameState accModel
            )
            model


updateGameState : Model -> Model
updateGameState model = model


updateTimeBuffer : Float -> Model -> Model
updateTimeBuffer timeSinceLast model = model



view : Model -> Html Msg
view model = renderGame model



type Component
    = ControlComponent ControlType
    | TagComponent String
    | CollectComponent String
    | TransformComponent TransformComponentData
    | DestroyComponent String

type ControlType
    = InputControl
    | AiControl AiSettings

type alias AiSettings =
    { startingDirection : String }


type alias TransformComponentData =
    { x : Int
    , y : Int
    }


type alias Actor = List Component

initializeActors : List Actor
initializeActors =
    let
        hero =
          [ ControlComponent InputControl
          , TagComponent "hero"
          , CollectComponent "diamond"
          , TransformComponent { x = 0, y = 0}
          ]
        enemy =
          [ ControlComponent <| AiControl { startingDirection = "right" }
          , DestroyComponent "hero"
          , TransformComponent { x = 5, y = 0}
          ]
    in
        [ hero, enemy ]



renderGame : Model -> Html Msg
renderGame model = text "the view"



main : Program () Model Msg
main =
    Browser.element
        { init = always (initialModel, Cmd.none)
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



burp =
    let
        _ =
            { components =
              [ TagComponent ""
              , CollectComponent ""
              , TransformComponent { x = 0, y = 0 }
              ]
            }
        _ = initializeActors
    in
        ()
