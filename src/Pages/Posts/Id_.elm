module Pages.Posts.Id_ exposing (page)

import Content.Posts
import Html
import Html.Attributes exposing (class)
import List
import Markdown
import View exposing (View)


page : { id : String } -> View msg
page params =
    let
        allPosts =
            Content.Posts.content.allPosts

        postIdMatchesRouteParam =
            \post -> post.id == params.id
    in
    case find postIdMatchesRouteParam allPosts of
        Nothing ->
            { title = "404"
            , body = [ Html.text "Post not found!" ]
            }

        Just post ->
            { title = post.title, body = [ viewPost post.body ] }


viewPost : String -> Html.Html msg
viewPost markdown =
    Markdown.toHtml [ class "post" ] markdown


find : (a -> Bool) -> List a -> Maybe a
find cb ls =
    let
        matches =
            List.filter cb ls
    in
    List.head matches
