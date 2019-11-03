module Main exposing (main)

import Browser
import Browser.Events
import Html exposing (Html, text)
import Browser.Events
import List.Extra

type alias Game =
    { level : Level
    }

type alias Level =
    { actors : List Actor
    }


initialModel : Model
initialModel =
    { timeBuffer = 0
    , actors = []
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



updateTimeBuffer : Float -> Model -> Model
updateTimeBuffer timeSinceLast model = model



view : Model -> Html Msg
view model = renderGame model



type Component
    = ControllerInputComponent
    | WalkAiComponent
    | TagComponent String
    | CollectComponent String
    | TransformComponent TransformComponentData
    | DestroyComponent String


type alias TransformComponentData =
    { x : Int
    , y : Int
    }


type alias Actor = List Component

initializeActors : List Actor
initializeActors =
    let
        hero =
          [ ControllerInputComponent
          , TagComponent "hero"
          , CollectComponent "diamond"
          , TransformComponent { x = 0, y = 0}
          ]
        enemy =
          [ WalkAiComponent
          , DestroyComponent "hero"
          , TransformComponent { x = 5, y = 0}
          ]
    in
        [ hero, enemy ]


updateActors : List Actor -> List Actor
updateActors actors =
    List.foldl updateActor actors actors

updateActor : Actor -> List Actor -> List Actor
updateActor actor accActors =
    List.foldl updateComponent actor actor
        |> updateActorInActors accActors

updateComponent : Component -> Actor -> Actor
updateComponent component actor =
    case component of
        WalkAiComponent ->
            updateWalkAiComponent actor
        _ ->
            actor



updateActorInActors : List Actor -> Actor -> List Actor
updateActorInActors actors actor = actors


type alias Model =
    { timeBuffer : Int
    , actors : List Actor
    }

updateGameState : Model -> Model
updateGameState model =
    let
        updateModelWithActors : List Actor -> Model
        updateModelWithActors newActors =
            { model | actors = newActors }
    in
    updateActors model.actors
        |> updateModelWithActors



--updateKillComponent : Actor -> List Actor
--updateKillComponent actor =
--    getActorNextToMe actor -- Returns: List Actor
--        |> removeThoseFromTheListOfActors
--            -- Ehh remove them from where?



updateKillComponent : Actor -> List Actor -> List Actor
updateKillComponent actor actors =
    getActorNextToMe actor
        |> removeThoseFromTheListOfActors actors



removeThoseFromTheListOfActors : List Actor -> List Actor -> List Actor
removeThoseFromTheListOfActors actors toBeRemovedActors = actors


updateWalkAiComponent : Actor -> Actor
updateWalkAiComponent actor =
    getTransformComponentData actor
        |> Maybe.map walkRight
        |> Maybe.map (setTransformComponent actor)
        |> Maybe.withDefault actor


getTransformComponentData : Actor -> Maybe TransformComponentData
getTransformComponentData actor =
    let
        asTransformComponent component =
            case component of
                TransformComponent transformData ->
                    Just transformData
                _ ->
                    Nothing
    in
        actor
        |> List.filterMap asTransformComponent
        |> List.head


getTransformComponentDataFancy : Actor -> Maybe TransformComponentData
getTransformComponentDataFancy =
    let
        asTransformComponent component =
            case component of
                TransformComponent transformData ->
                    Just transformData
                _ ->
                    Nothing
    in
        List.filterMap asTransformComponent >> List.head


walkRight : TransformComponentData -> TransformComponentData
walkRight transformData =
    { transformData | x = transformData.x + 1 }


setTransformComponent : Actor -> TransformComponentData -> Actor
setTransformComponent actor transformData =
    let
        isTransformComponent component =
            case component of
                TransformComponent _ ->
                    True
                _ ->
                    False
    in
    actor
        |> List.Extra.filterNot isTransformComponent
        |> List.append [TransformComponent transformData]


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
              [ ControllerInputComponent
              , WalkAiComponent
              , TagComponent ""
              , CollectComponent ""
              , TransformComponent { x = 0, y = 0 }
              ]
            }
        _ = initializeActors
        _ = updateWalkAiComponent
        _ = getTransformComponentDataFancy
        _ = updateActors
        _ = updateKillComponent
    in
        ()


getActorNextToMe : Actor -> List Actor
getActorNextToMe actor = []