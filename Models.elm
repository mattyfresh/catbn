module Models exposing (..)

import Hop.Types exposing (Address)
import Routes exposing (Route)


type alias Model =
    { bandPrefix : String
    , theBandName : String
    , route : Route
    , address : Address
    , isHome : Bool
    }
