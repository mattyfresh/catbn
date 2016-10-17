module Routing exposing (..)

import Navigation
import Hop exposing (makeResolver)
import Hop.Types exposing (Address)
import UrlParser exposing (..)
import Routes exposing (..)
import Models exposing (..)


-- honestly, don't quite get this urlParser bit yet...


urlParser : Navigation.Parser ( Route, Address )
urlParser =
    let
        parse path =
            path
                |> UrlParser.parse identity routes
                |> Result.withDefault NotFoundRoute

        resolver =
            Hop.makeResolver hopConfig parse
    in
        Navigation.makeParser (.href >> resolver)



-- simply update the route and address props on the model


urlUpdate : ( Route, Address ) -> Model -> ( Model, Cmd msg )
urlUpdate ( route, address ) model =
    ( { model | route = route, address = address }, Cmd.none )


navigateTo : String -> Cmd msg
navigateTo path =
    Hop.outputFromPath Routes.hopConfig path
        |> Navigation.newUrl
