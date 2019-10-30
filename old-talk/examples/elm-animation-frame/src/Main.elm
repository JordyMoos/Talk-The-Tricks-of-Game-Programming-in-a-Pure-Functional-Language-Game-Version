module Main exposing (main)

import Browser
import Browser.Events
import Html exposing (Html, button, div, text)
import Browser.Events
import Time exposing (Posix)


type alias Model = {}


initialModel : Model
initialModel = {}


type Msg
    = Tick Float

subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onAnimationFrameDelta Tick

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Tick timeSinceLast ->
            updateGameState model



updateGameState : Model -> (Model, Cmd Msg)
updateGameState model = (model, Cmd.none)


view : Model -> Html Msg
view model = text "the view"

main : Program () Model Msg
main =
    Browser.element
        { init = always (initialModel, Cmd.none)
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
