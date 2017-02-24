module SeatSaver exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Task exposing (Task)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Seat =
    { seatNo : Int
    , occupied : Bool
    }


type alias Model =
    List Seat


init : ( Model, Cmd Msg )
init =
    let
        seats =
            [ { seatNo = 1, occupied = False }
            , { seatNo = 2, occupied = False }
            , { seatNo = 3, occupied = False }
            , { seatNo = 4, occupied = False }
            , { seatNo = 5, occupied = False }
            , { seatNo = 6, occupied = False }
            , { seatNo = 7, occupied = False }
            , { seatNo = 8, occupied = False }
            , { seatNo = 9, occupied = False }
            , { seatNo = 10, occupied = False }
            , { seatNo = 11, occupied = False }
            , { seatNo = 12, occupied = False }
            ]
    in
        ( seats, Cmd.none )



-- UPDATE


type Msg
    = Toggle Seat


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Toggle seatToToggle ->
            let
                updateSeat seatFromModel =
                    if seatFromModel.seatNo == seatToToggle.seatNo then
                        { seatFromModel | occupied = not seatFromModel.occupied }
                    else
                        seatFromModel
            in
                ( List.map updateSeat model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    ul [ class "seats" ] (List.map seatItem model)


seatItem : Seat -> Html Msg
seatItem seat =
    let
        occupiedClass =
            if seat.occupied then
                "occupied"
            else
                "available"
    in
        li
            [ class ("seat " ++ occupiedClass)
            , onClick (Toggle seat)
            ]
            [ text (toString seat.seatNo) ]
