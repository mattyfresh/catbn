module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)
import About exposing (BandMember, bandMembers)
import Messages exposing (..)
import Routes exposing (Route)
import Routing exposing (..)


-- main shared view


render model =
    case model.route of
        Routes.HomeRoute ->
            div [ class "main__container" ]
                [ nav [ class "main__container-nav" ]
                    [ a [ onClick (Routing.navigateTo ""), attribute "style" "padding: 10px; cursor: pointer; font-family: sans-serif;" ] [ text "Home" ]
                    , a [ onClick (Routing.navigateTo "/about"), attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "About" ]
                    ]
                , h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; margin-bottom: 0; padding: 12px;" ]
                    [ text (model.bandPrefix ++ model.theBandName) ]
                  -- , homePage
                ]

        Routes.AboutRoute ->
            div [ class "main__container" ]
                [ nav [ class "main__container-nav" ]
                    [ a [ href "", attribute "style" "padding: 10px; cursor: pointer; font-family: sans-serif;" ] [ text "Home" ]
                    , a [ href "/about", attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "About" ]
                    , a [ href "/photos", attribute "style" "padding: 10px; cursor: pointer; margin-left: 20px; font-family: sans-serif;" ] [ text "Photos" ]
                    ]
                , h1 [ attribute "style" "text-align: center;font-family: monospace; font-size: 40px; font-weight: normal; margin-bottom: 0; padding: 12px;" ]
                    [ text (model.bandPrefix ++ model.theBandName) ]
                  -- , aboutPage
                ]

        Routes.PhotosRoute ->
            div [] [ text "There will be photos here!  Seriously." ]

        Routes.NotFoundRoute ->
            div [] [ text "HOME" ]



-- ABOUT PAGE


aboutPage : Html Route
aboutPage =
    div []
        [ h2 [ attribute "style" "text-align: center;font-family: monospace; font-weight: normal; margin-top: 0; padding: 20px;" ] [ text "About Us" ]
        , div [] (List.map renderBios bandMembers)
        ]


imageStyles : List ( String, String )
imageStyles =
    [ ( "border", "solid black 4px" )
    , ( "display", "block" )
    , ( "margin", "auto" )
    , ( "max-width", "660px" )
    , ( "width", "100%" )
    ]



-- Homepage layout


homePage =
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
            [ a
                [ href ("mailto:matthew.padich@gmail.com?subject=Carter and the ")
                , attribute "style" "font-family: monospace; font-size: 16px; color: black; display: inline-block; margin: 60px 0 30px; padding: 10px;"
                ]
                [ text "Email Us!" ]
            ]
        ]



-- About page layout


renderBios : BandMember -> Html a
renderBios bio =
    ul [ attribute "style" "list-style-type: none; text-align: center; padding: 0; width: 90%; margin: auto;" ]
        [ li [ attribute "style" "display: block;", class "bio__name" ] [ text bio.name ]
        , li [] [ img [ src bio.imageUrl, style imageStyles ] [] ]
        , li [ class "bio__quote" ] [ text bio.quote ]
        ]
