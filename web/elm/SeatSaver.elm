module SeatSaver exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Task exposing (Task)
import Http
import Json.Decode as Json exposing (field)


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
    ( [], fetchSeats )



-- UPDATE


type Msg
    = Toggle Seat
    | SetSeats (Result Http.Error Model)


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

        SetSeats (Ok seats) ->
            let
                newModel =
                    seats
            in
                ( newModel, Cmd.none )

        SetSeats (Err _) ->
            ( model, Cmd.none )



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



-- EFFECTS


fetchSeats : Cmd Msg
fetchSeats =
    let
        url =
            "http://localhost:4000/api/seats"
    in
        Http.send SetSeats (Http.get url decodeSeats)



--
-- fetchSeats : Cmd Msg
-- fetchSeats =
--     Http.get "http://localhost:4000/api/seats" decodeSeats
--         |> Task.mapError toString
--         |> Task.perform ErrorOccurred SetSeats


decodeSeats : Json.Decoder Model
decodeSeats =
    let
        seat =
            Json.map2 (\seatNo occupied -> (Seat seatNo occupied))
                (field "seatNo" Json.int)
                (field "occupied" Json.bool)
    in
        Json.at [ "data" ] (Json.list seat)
