port module SeatSaver exposing (..)

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
        , subscriptions = incomingActions
        }


type alias Seat =
    { seatNo : Int
    , occupied : Bool
    }


type alias Model =
    List Seat


init : ( Model, Cmd Msg )
init =
    ( [], Cmd.none )



-- UPDATE


type Msg
    = Toggle Seat
    | SetSeats Model


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

        SetSeats seats ->
            ( seats, Cmd.none )



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


incomingActions : Model -> Sub Msg
incomingActions model =
    Sub.map SetSeats model


port seatLists : (Model -> msg) -> Sub msg
