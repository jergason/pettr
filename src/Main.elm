module Main exposing (..)

import Debug
import Html exposing (h1, h2, span, div, text, img, button, Html)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Html.App as App


type alias Model =
    { animal : Animal
    , pets : Int
    }


model : Model
model =
    { animal = jake, pets = 0 }


type alias Animal =
    { name : String
    , kind : String
    , size : String
    , sex : String
    , description : Maybe String
    , imageUrl : String
    }


jake : Animal
jake =
    { name = "Jake"
    , kind = "Siberian Husky"
    , size = "L"
    , sex = "Male"
    , imageUrl = "http://photos.petfinder.com/photos/pets/35913763/1/?bust=1470806456&width=500&-x.jpg"
    , description = Nothing
    }


type Msg
    = Pet
    | UnPet


update : Msg -> Model -> Model
update msg model =
    case msg of
        Pet ->
            { model | pets = model.pets + 1 }

        UnPet ->
            { model | pets = model.pets - 1 }


view : Model -> Html Msg
view data =
    div [ class "container" ]
        [ div [ class "animal" ]
            [ h1 [] [ text "PETTR" ]
            , h2 []
                [ text data.animal.name ]
            , div [ class "subtitles" ]
                [ span []
                    [ text data.animal.kind ]
                , span []
                    [ text data.animal.sex ]
                ]
            , div []
                [ img [ src data.animal.imageUrl ]
                    []
                ]
            , div []
                [ button
                    [ class "btn btn-primary"
                    , onClick Pet
                    ]
                    [ text "Pet" ]
                , button
                    [ class "btn btn-primary"
                    , onClick UnPet
                    ]
                    [ text "Un-Pet" ]
                ]
            , h1 [] [ text ("Pets: " ++ (toString data.pets)) ]
            ]
        ]


main : Program Never
main =
    App.beginnerProgram { model = model, view = view, update = update }
