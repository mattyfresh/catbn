module About exposing (bandMembers, BandMember)


type alias BandMember =
    { name : String
    , imageUrl : String
    , quote : String
    }


tony : BandMember
tony =
    { name = "Tony Derbz"
    , imageUrl = "images/tony.jpg"
    , quote = "Spawned from beer, metal on metal action, butts and a love for everything produced out of self loathing. The Derbster was born. Ohh yeah he also plays bass and loves puppies."
    }


matthew : BandMember
matthew =
    { name = "Matty Fresh"
    , imageUrl = "images/matthew.jpg"
    , quote = "I once tried to eat a triple cheese burger whilst high on LSD."
    }


carter : BandMember
carter =
    { name = "Carter Z"
    , imageUrl = "images/carter.jpg"
    , quote = "Lover of all things peanut butter, one day dreams of becoming Buffy the vampire slayer."
    }


bandMembers : List BandMember
bandMembers =
    [ carter, matthew, tony ]
