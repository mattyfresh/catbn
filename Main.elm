module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { bandPrefix : String
    , theBandName : String
    }


type Msg
    = ChangeBandName String



-- just the title for now


model : Model
model =
    { bandPrefix = "Carter and the "
    , theBandName = "Bad News."
    }


imageStyles : List ( String, String )
imageStyles =
    [ ( "border", "solid black 4px" )
    , ( "display", "block" )
    , ( "margin", "auto" )
    , ( "max-width", "660px" )
    , ( "width", "90%" )
    ]



-- simple main view


view : Model -> Html Msg
view model =
    div [ class "main__container" ]
        [ h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; margin-bottom: 0; padding: 20px;" ]
            [ text (model.bandPrefix ++ model.theBandName) ]
        , h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "Tunes coming soon!" ]
        , img
            [ id "main-image"
            , src "images/run.gif"
            , style imageStyles
            ]
            []
        , input
            [ placeholder "Change our band name yah dude!"
            , onInput ChangeBandName
            , attribute "style" "display: block; height: 34px; font-size: 16px; width: 50%;max-width: 500px; min-width: 300px; margin: 20px auto 0; font-family: monospace;"
            ]
            []
        , div [ style [ ( "text-align", "center" ) ] ]
            -- notice the inline styles are perfectly ok as well, via attribute "thing" "string of selectors, attrs"
            [ a
                [ href "mailto:matthewpadich@gmail.com?subject=Carter and the Bad News Info"
                , attribute "style" "font-family: monospace; font-size: 16px; color: black; display: inline-block; margin-top: 60px; padding: 10px;"
                ]
                [ text "Email Us!" ]
            ]
        ]



-- update the band name


update : Msg -> Model -> Model
update action updatedModel =
    case action of
        ChangeBandName newTitle ->
            if newTitle == "" then
                -- return the original model
                model
            else
                { updatedModel | theBandName = newTitle }



-- start the app


main : Program Never
main =
    Html.App.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
