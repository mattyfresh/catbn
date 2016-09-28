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
    , quote = "Sometimes I may say \"no\", but just ask me two more times, I'll come around!"
    }


carter : BandMember
carter =
    { name = "Carter Z"
    , imageUrl = "images/carter.jpg"
    , quote = "Lover of all things peanut butter, one day I dream of becoming Buffy the vampire slayer."
    }


bandMembers : List BandMember
bandMembers =
    [ carter, matthew, tony ]
