{- Vocab Quiz: A word challenge game.

   Copyright (C) 1987-2009  Apogee Software, Ltd.
   Copyright (C) 2017 Huggable Monad

   This file is part of Vocab Quiz.

   Vocab Quiz is free software: you can redistribute it and/or modify it under
   the terms of the GNU General Public License as published by the Free
   Software Foundation, either version 2 of the License, or (at your option)
   any later version.

   Vocab Quiz is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
   more details.

   You should have received a copy of the GNU General Public License along with
   Vocab Quiz.  If not, see <https://www.gnu.org/licenses/>.
-}


module Quiz exposing (Model, init, Msg, update, subscriptions, view)

{-| Core module of the `Vocab Quiz` application.

# Elm Architecture API
@docs Model, init, Msg, update, subscriptions, view

-}

-- Core library imports.

import Html exposing (Html)
import Html.Attributes as Html
import Html.Events as Html
import Random
import Task
import Time


-- 3rd party imports.

import List.Extra as List
import Random.List as Random


-- Application specific imports.

import QandA exposing (QandA)


{-| Used for tracking the user's answer.
-}
type Reply
    = Right
    | Wrong
    | Unanswered


{-| Application state.
-}
type alias Model =
    { bonusMiss : Int
    , questionsAnswered : Int
    , questionsRemaining : List Int
    , correctAnswers : Int
    , currentAnswer : Reply
    , isBonusMissIncreased : Bool
    , isGameOver : Bool
    }


{-| Initialize the application state.
-}
init : ( Model, Cmd Msg )
init =
    ( Model 10 0 [] 0 Unanswered False False
    , Task.perform InitRandomSeed Time.now
    )


{-| Messages handled by the application.
-}
type Msg
    = InitRandomSeed Time.Time
    | CheckAnswer Int
    | NextQuestion


{-| Update the application state.
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InitRandomSeed time ->
            initRandomSeed time model

        CheckAnswer answer ->
            let
                newModel =
                    checkAnswer answer model
                        |> checkGameOver
            in
                ( newModel, Cmd.none )

        NextQuestion ->
            nextQuestion model


{-| Initialize the random seed.
-}
initRandomSeed : Time.Time -> Model -> ( Model, Cmd msg )
initRandomSeed time model =
    let
        generator =
            List.range 1 100
                |> Random.shuffle

        ( questions, _ ) =
            truncate time
                |> Random.initialSeed
                |> Random.step generator
    in
        ( { model | questionsRemaining = questions }
        , Cmd.none
        )


{-| Check the user's answer and update the model accordingly.

The `Int` must lie in the interval `[1 .. 4]`.
-}
checkAnswer : Int -> Model -> Model
checkAnswer answer model =
    let
        correct =
            List.head model.questionsRemaining
                |> Maybe.withDefault 0
                |> isCorrectAnswer answer

        newQuestionsAnswered =
            model.questionsAnswered + 1

        newCorrectAnswers =
            if correct then
                model.correctAnswers + 1
            else
                model.correctAnswers

        newCurrentAnswer =
            if correct then
                Right
            else
                Wrong

        newBonusMiss =
            if not correct then
                model.bonusMiss - 1
            else if correct && (newCorrectAnswers % 10 == 0) then
                model.bonusMiss + 1
            else
                model.bonusMiss

        newIsBonusMissIncreased =
            if newBonusMiss > model.bonusMiss then
                True
            else
                False

        newModel =
            { model
                | bonusMiss = newBonusMiss
                , questionsAnswered = newQuestionsAnswered
                , correctAnswers = newCorrectAnswers
                , currentAnswer = newCurrentAnswer
                , isBonusMissIncreased = newIsBonusMissIncreased
            }
    in
        newModel


{-| `isCorrectAnswer answer question` returns `True` if the user answered
correctly.

`answer` must lie in the interval `[1 .. 4]`, and `question` must lie in the
interval `[1 .. 100]`.
-}
isCorrectAnswer : Int -> Int -> Bool
isCorrectAnswer answer question =
    if question < 1 || question > 100 then
        False
    else if question <= 25 then
        answer == 1
    else if question <= 50 then
        answer == 2
    else if question <= 75 then
        answer == 3
    else
        answer == 4


{-| Check if the quiz is over and update the model accordingly.

The quiz ends if:

* there're no bonus misses left; or
* the user has answered all the questions
-}
checkGameOver : Model -> Model
checkGameOver model =
    { model
        | isGameOver =
            model.bonusMiss
                == 0
                || model.questionsAnswered
                == 100
    }


{-| Advance to the next question.
-}
nextQuestion : Model -> ( Model, Cmd Msg )
nextQuestion model =
    let
        newQuestionsRemaining =
            List.tail model.questionsRemaining
                |> Maybe.withDefault []

        newModel =
            { model
                | questionsRemaining = newQuestionsRemaining
                , currentAnswer = Unanswered
            }
    in
        ( newModel, Cmd.none )


{-| Event sources that the application subscribes to.
-}
subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


{-| View the application state as HTML.
-}
view : Model -> Html Msg
view model =
    Html.div []
        [ viewStatusBar model
        , Html.hr [] []
        , viewQuestion model
        , viewChoices model
        , viewComment model
        , viewControls model
        , viewGameOver model
        ]


{-| Return the question as HTML.
-}
viewQuestion : Model -> Html msg
viewQuestion model =
    let
        question =
            getQandA model
                |> Maybe.map QandA.question
                |> Maybe.withDefault "Error retrieving question."
    in
        Html.div [ Html.id "question" ]
            [ Html.text question ]


{-| Return the choices as HTML.
-}
viewChoices : Model -> Html Msg
viewChoices model =
    let
        choices =
            List.zip (List.range 1 4) <|
                case getQandA model of
                    Just qa ->
                        QandA.answers qa

                    Nothing ->
                        [ "Error retrieving answers." ]

        radio ( value, str ) =
            Html.div []
                [ Html.label
                    []
                    [ Html.input
                        [ Html.type_ "radio"
                        , Html.name "choices"
                        , Html.onClick (CheckAnswer value)
                        ]
                        []
                    , Html.text str
                    ]
                ]
    in
        Html.div [ Html.id "answers" ]
            [ List.map radio choices
                |> Html.fieldset
                    [ Html.disabled (model.currentAnswer /= Unanswered)
                    ]
            ]


{-| Return the comment as HTML.
-}
viewComment : Model -> Html msg
viewComment model =
    let
        comment =
            if model.currentAnswer /= Unanswered then
                getQandA model
                    |> Maybe.andThen QandA.comment
                    |> Maybe.withDefault ""
            else
                ""

        feedback =
            case model.currentAnswer of
                Right ->
                    "You got it right"
                        ++ if model.isBonusMissIncreased then
                            "... and also earned a BONUS MISS"
                           else
                            ""

                Wrong ->
                    "Wrong, you lost a BONUS MISS"

                Unanswered ->
                    ""
    in
        Html.div []
            [ Html.p [ Html.class "feedback" ] [ Html.text comment ]
            , Html.p [ Html.class "feedback" ] [ Html.text feedback ]
            ]


{-| Return the status as HTML.
-}
viewStatusBar : Model -> Html msg
viewStatusBar model =
    let
        question =
            Html.div []
                [ Html.text "Questions answered: "
                , model.questionsAnswered
                    |> toString
                    |> Html.text
                ]

        correct =
            Html.div []
                [ Html.text "Correct answers: "
                , toString model.correctAnswers
                    |> Html.text
                ]

        misses =
            Html.div []
                [ Html.text "Misses left: "
                , toString model.bonusMiss
                    |> Html.text
                ]

        rank =
            Html.div []
                [ Html.text "Rank: "
                , updateRank model
                    |> Html.text
                ]
    in
        Html.div [ Html.id "status-bar" ]
            [ question, correct, misses, rank ]


{-| Update the user's rank based on their performance.
-}
updateRank : Model -> String
updateRank model =
    let
        percent =
            if model.correctAnswers > 0 then
                if model.questionsAnswered == 1 then
                    100
                else
                    1 / (toFloat model.questionsAnswered / toFloat model.correctAnswers) * 100
            else
                0
    in
        if percent <= 9 then
            "Word Wimp"
        else if percent <= 19 then
            "3rd Grade Reading Level!"
        else if percent <= 29 then
            "6th Grade Reading Level!"
        else if percent <= 39 then
            "9th Grade Reading Level"
        else if percent <= 49 then
            "High School Graduate Level"
        else if percent <= 59 then
            "AAA--Above Average America"
        else if percent <= 69 then
            "College Graduate Level"
        else if percent <= 79 then
            "The Dictionary Dude!"
        else if percent <= 89 then
            "Professor of Wordology!"
        else if model.questionsAnswered > 85 then
            "WORD WHIZ OF THE GALAXY!"
        else
            "Word Whiz"


{-| Return the controls for progressing through the quiz as HTML.
-}
viewControls : Model -> Html Msg
viewControls model =
    Html.div []
        [ Html.button
            [ Html.id "next-question"
            , model.currentAnswer
                == Unanswered
                || model.isGameOver
                |> Html.hidden
            , Html.onClick NextQuestion
            ]
            [ Html.text "Next Question" ]
        ]


{-| Return the `Game Over` message as HTML.
-}
viewGameOver : Model -> Html Msg
viewGameOver model =
    let
        score =
            model.correctAnswers
                + model.bonusMiss
                |> toString

        scoreStr =
            if not model.isGameOver then
                ""
            else
                "You scored "
                    ++ score
                    ++ " points,"
                    ++ " which is a total of questions correct,"
                    ++ " plus unused misses."

        str =
            if not model.isGameOver then
                ""
            else if model.questionsAnswered == 100 then
                "Congratulations, you have completed VOCAB QUIZ!"
            else
                "You have not yet finished VOCAB QUIZ!"
    in
        Html.div
            [ Html.id "game-over" ]
            [ Html.p [] [ Html.text str ]
            , Html.p [] [ Html.text scoreStr ]
            ]


{-| Return the current `QandA`.
-}
getQandA : Model -> Maybe QandA
getQandA model =
    List.head model.questionsRemaining
        |> Maybe.andThen QandA.get
