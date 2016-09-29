module Routes exposing (..)

import UrlParser exposing ((</>))
import Hop.Types exposing (Config, Address)


-- Set base path to empty, no hash routing


hopConfig : Config
hopConfig =
    { hash = False
    , basePath = ""
    }



--  define each of our Routes here, photos route still needs to be built


type Route
    = HomeRoute
    | AboutRoute
    | PhotosRoute
    | NotFoundRoute



-- will return us one of our routes, `UrlParser.s` is an exact string match
-- so `catnb.com/about` will match


routes : UrlParser.Parser (Route -> a) a
routes =
    UrlParser.oneOf
        [ UrlParser.format HomeRoute (UrlParser.s "")
        , UrlParser.format AboutRoute (UrlParser.s "about")
        , UrlParser.format PhotosRoute (UrlParser.s "photos")
        ]
