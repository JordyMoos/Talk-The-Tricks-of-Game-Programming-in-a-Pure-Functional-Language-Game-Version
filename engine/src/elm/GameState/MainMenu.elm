module GameState.MainMenu exposing
    ( Action(..)
    , Model
    , init
    , updateTick
    , view
    )

import Data.Config exposing (Config)
import Html exposing (Html)
import InputController
import Menu.TextMenu as TextMenu
import Text


type alias Model =
    { textMenu : TextMenu.Model Action
    }


type Action
    = Stay Model
    | LoadLevel String
    | LoadFlags
    | ShowCredits


init : Config -> Model
init config =
    { textMenu =
        TextMenu.init config
            { items =
                { before = []
                , selected =
                    { text = Text.stringToLetters "Pixel"
                    , action = LoadLevel "oredev/official-001-in-pixel"
                    }
                , after =
                    [ { text = Text.stringToLetters "Image"
                      , action = LoadLevel "oredev/official-001-with-cheats"
                      }
                    , { text = Text.stringToLetters "1: World 1"
                      , action = LoadLevel "oredev/world-1"
                      }
                    , { text = Text.stringToLetters "2: World 2"
                      , action = LoadLevel "oredev/world-2"
                      }
                    , { text = Text.stringToLetters "3: World 3"
                      , action = LoadLevel "oredev/world-3"
                      }
                    ]
                }
            }
    }


updateTick : InputController.Model -> Model -> Action
updateTick inputModel model =
    case TextMenu.updateTick inputModel model.textMenu of
        TextMenu.Stay textMenu ->
            Stay { model | textMenu = textMenu }

        TextMenu.Invoke action ->
            action


view : Model -> Html msg
view model =
    TextMenu.view model.textMenu
