module Content exposing (decoder)

import Content.Decode as Decode
import Content.Type as Type


decoder : Type.Path -> Decode.QueryResult
decoder typePath =
    case typePath of
        -- Will match `content/posts.md`
        Type.Single [ "Content", "Posts" ] ->
            Decode.frontmatter Decode.string
                [ Decode.attribute "allPosts" (Decode.list (Decode.reference (Type.Collection [ "Content", "Posts" ])))
                ]

        -- Will match `content/posts/[first-post].md`, `content/posts/[second-post].md`, etc
        Type.Collection [ "Content", "Posts" ] ->
            Decode.frontmatter Decode.string
                [ Decode.attribute "title" Decode.string
                , Decode.attribute "id" Decode.string
                ]

        _ ->
            Decode.throw
