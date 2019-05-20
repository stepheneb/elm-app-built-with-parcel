module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Browser.Navigation
import Html exposing (Html, a, div, h1, img, p, text)
import Html.Attributes exposing (class, href, src, target)
import Url exposing (Url)



---- PROGRAM ----


type alias Images =
    { actionOkIcon : String
    , actionCancelIcon : String
    , appBabelfishIcon : String
    , wetPinkTulipSmall : String
    , fivePointedStar : String
    }


main : Program Images Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = ChangedUrl
        }


init : Images -> Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init images url key =
    ( initialModel images url key, Cmd.none )



---- MODEL ----


type alias Model =
    { content : String
    , url : Url.Url
    , key : Browser.Navigation.Key
    , img : Images
    }


initialModel : Images -> Url.Url -> Browser.Navigation.Key -> Model
initialModel images url key =
    { content = "Hello rainy day in Boston."
    , url = url
    , key = key
    , img = images
    }


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none



---- UPDATE ----


type Msg
    = NoOp
    | ClickedLink Browser.UrlRequest
    | ChangedUrl Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ClickedLink urlRequest ->
            ( model
            , Cmd.none
            )

        ChangedUrl url ->
            ( model
            , Cmd.none
            )



---- VIEW ----


view : Model -> Browser.Document Msg
view model =
    { title = "Elm App"
    , body =
        [ div [ class "flex-grid" ]
            [ div [ class "upper-left" ]
                [ img [ src model.img.actionOkIcon, class "icon" ] []
                ]
            , div
                [ class "upper-right" ]
                [ img [ src model.img.actionCancelIcon, class "icon" ] []
                ]
            , div [ class "lower-left" ]
                [ img [ src model.img.appBabelfishIcon, class "icon" ] []
                ]
            , div [ class "lower-center" ]
                [ img [ src model.img.fivePointedStar, class "icon" ] []
                ]
            , div [ class "lower-right" ]
                [ img [ src model.img.wetPinkTulipSmall, class "icon" ] []
                ]
            , div [ class "col" ] []
            , div [ class "col" ]
                [ h1 [] [ text "Hello Elm App" ]
                , p [] [ text model.content ]
                ]
            , div [ class "col" ]
                [ div [ class "header-details-right" ]
                    [ a
                        [ href "https://github.com/stepheneb/elm-app-built-with-parcel"
                        , target "_blank"
                        ]
                        [ text "source code" ]
                    ]
                ]
            ]
        ]
    }
