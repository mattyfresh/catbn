module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (..)


type alias Model =
    { mainTitle : String }



-- just the title for now


model : Model
model =
    { mainTitle = "Carter and the Bad News" }


imageStyles : List ( String, String )
imageStyles =
    [ ( "border", "solid black 4px" )
    , ( "display", "block" )
    , ( "margin", "auto" )
    , ( "max-width", "660px" )
    , ( "width", "90%" )
    ]



-- simple main view


view : Model -> Html a
view model =
    div [ class "main__container" ]
        [ h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; padding: 20px;" ]
            [ text model.mainTitle ]
        , img [ id "main-image", src "images/run.gif", style imageStyles ] []
        , div [ style [ ( "text-align", "center" ) ] ]
            -- notice the inline styles are perfectly ok as well, via attribute "thing" "string of selectors, attrs"
            [ a [ href "mailto:matthewpadich@gmail.com?subject=Carter and the Bad News Info", attribute "style" "font-family: monospace; font-size: 16px; color: black; display: block; margin-top: 60px;" ]
                [ text "Email Us!" ]
            ]
        ]



-- placeholder update func for now


update : a -> Model -> Model
update action model =
    case action of
        _ ->
            model



-- start the app


main : Program Never
main =
    Html.App.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
