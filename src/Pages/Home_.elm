module Pages.Home_ exposing (page)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Markdown
import View exposing (View)


page : View msg
page =
    { title = "Homepage"
    , body = [ content ]
    }


content : Html msg
content =
    Markdown.toHtmlWith options [ class "content" ] """

# Todo list

  1. [x] Test markdown to HTML lib
  2. [ ] Add dynamic route for articles
  3. [ ] Add elm-frontmatter
  4. [ ] Add articles as .md files

"""


options =
    { githubFlavored = Just { tables = True, breaks = True }
    , defaultHighlighting = Nothing
    , sanitize = True
    , smartypants = False
    }
