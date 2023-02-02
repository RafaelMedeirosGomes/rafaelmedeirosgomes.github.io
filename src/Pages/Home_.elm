module Pages.Home_ exposing (page)

import Content.Posts
import Html exposing (Html)
import Html.Attributes exposing (href)
import View exposing (View)


page : View msg
page =
    { title = "Homepage"
    , body = content
    }


content : List (Html msg)
content =
    List.map viewLink Content.Posts.content.allPosts


viewLink : Content.Posts.CollectionItem -> Html msg
viewLink post =
    Html.a [ href ("/posts/" ++ post.id) ] [ Html.text post.title ]
