module Main exposing (..)

import Dict exposing (Dict)
import Models exposing (Model)
import Routes exposing (..)
import Routing exposing (..)
import Navigation exposing (..)
import Views exposing (render)
import Messages exposing (Msg(..))


init : ( a, b ) -> ( Model, Cmd a )
init ( route, address ) =
    ( model, Cmd.none )



-- Shared Model and image styles


model : Model
model =
    { address =
        { path = [ "" ]
        , query = Dict.empty
        }
    , route = HomeRoute
    , bandPrefix = "Carter and the "
    , theBandName = "Bad News."
    }



-- update the band name or the route depending upon the Msg received


update action model =
    case action of
        ChangeBandName newTitle ->
            if newTitle == "" then
                -- return the original model
                ( model, Cmd.none )
            else
                let
                    newModel =
                        { model | theBandName = newTitle }
                in
                    ( newModel, Cmd.none )

        _ ->
            ( model, Cmd.none )


subscriptions model =
    Sub.none


main : Program Never
main =
    Navigation.program Routing.urlParser
        { subscriptions = subscriptions
        , init = init
        , view = Views.render
        , update = update
        , urlUpdate = Routing.urlUpdate
        }
