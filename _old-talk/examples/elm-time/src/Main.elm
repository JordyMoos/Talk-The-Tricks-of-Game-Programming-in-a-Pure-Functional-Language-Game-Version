module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Time exposing (Posix)


type alias Model = {}


initialModel : Model
initialModel = {}


type Msg
    = Tick Posix

subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 17 Tick

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Tick posix ->
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
