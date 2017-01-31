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


module Main exposing (main)

{-| Module containing the entry point to the `Vocab Quiz` program.

@docs main

-}

-- 3rd party imports.

import Html


-- Application specific imports.

import Quiz


{-| Main entry point.
-}
main : Program Never Quiz.Model Quiz.Msg
main =
    Html.program
        { init = Quiz.init
        , update = Quiz.update
        , subscriptions = Quiz.subscriptions
        , view = Quiz.view
        }
