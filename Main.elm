module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import About exposing (bandMembers)


type alias Model =
    { bandPrefix : String
    , theBandName : String
    , isHome : Bool
    }


type Msg
    = ChangeBandName String
    | ToHomePage
    | ToAboutPage



-- Shared Model and image styles


model : Model
model =
    { bandPrefix = "Carter and the "
    , theBandName = "Bad News."
    , isHome = True
    }


imageStyles : List ( String, String )
imageStyles =
    [ ( "border", "solid black 4px" )
    , ( "display", "block" )
    , ( "margin", "auto" )
    , ( "max-width", "660px" )
    , ( "width", "90%" )
    ]



-- Homepage layout


homePage : Model -> Html Msg
homePage model =
    div []
        [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "Tunes coming soon!" ]
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
                [ href ("mailto:matthewpadich@gmail.com?subject=Carter and the " ++ model.theBandName)
                , attribute "style" "font-family: monospace; font-size: 16px; color: black; display: inline-block; margin-top: 60px; padding: 10px;"
                ]
                [ text "Email Us!" ]
            ]
        ]



-- About page layout


renderBios : About.BandMember -> Html Msg
renderBios bio =
    ul [ attribute "style" "list-style-type: none; text-align: center; padding: 0;" ]
        [ li [ attribute "style" "display: block;" ] [ text bio.name ]
        , li [] [ img [ src bio.imageUrl, style imageStyles ] [] ]
        , li [] [ text bio.quote ]
        ]


aboutPage : Html Msg
aboutPage =
    div []
        [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "About Us" ]
        , div [] (List.map renderBios bandMembers)
        ]



-- main shared view


view : Model -> Html Msg
view model =
    div [ class "main__container" ]
        [ nav [ class "main__container-nav" ]
            [ a [ onClick ToHomePage, attribute "style" "padding: 10px; cursor: pointer; font-family: sans-serif;" ] [ text "Home" ]
            , a [ onClick ToAboutPage, attribute "style" "padding: 10px; cursor: pointer; margin-left: 10px; font-family: sans-serif;" ] [ text "About" ]
            ]
        , h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; margin-bottom: 0; padding: 20px;" ]
            [ text (model.bandPrefix ++ model.theBandName) ]
        , if model.isHome == True then
            homePage model
          else
            aboutPage
        ]



-- update the band name or the route depending upon the Msg received


update : Msg -> Model -> Model
update action updatedModel =
    case action of
        ChangeBandName newTitle ->
            if newTitle == "" then
                -- return the original model
                model
            else
                { updatedModel | theBandName = newTitle }

        ToAboutPage ->
            { updatedModel | isHome = False }

        ToHomePage ->
            { updatedModel | isHome = True }


main : Program Never
main =
    Html.App.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
