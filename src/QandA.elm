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


module QandA exposing (QandA, get, question, answers, comment)

{-| This module contains the quiz data (questions, answers, and comments).

@docs QandA, get, question, answers, comment

-}

-- Core library imports.

import Dict exposing (Dict)


{-| A question and answer set.
-}
type QandA
    = QandA
        { question : String
        , answers : List String
        , comment : Maybe String
        }


{-| Return a [`QandA`](#QandA).

The `Int` must lie in the interval `[1 .. 100]`.
-}
get : Int -> Maybe QandA
get n =
    Dict.get n qAndA


{-| Return the question.
-}
question : QandA -> String
question (QandA { question, answers, comment }) =
    question


{-| Return the possible answers to the given question.
-}
answers : QandA -> List String
answers (QandA { question, answers, comment }) =
    answers


{-| Return the comment, if any.
-}
comment : QandA -> Maybe String
comment (QandA { question, answers, comment }) =
    comment


{-| Return the quiz data (questions, answers, and comments).
-}
qAndA : Dict Int QandA
qAndA =
    Dict.fromList
        [ ( 1, QandA { question = "The conversation became ACRIMONIOUS after Tom teased Jane's big nose.", answers = [ "Bitter", "Sweet", "Laughable", "Hopeless" ], comment = Just "Comparable words are CHOLERIC and HEATED." } )
        , ( 26, QandA { question = "The BELEAGUERED boy finally told his teacher about the play ground bully.", answers = [ "Beaten", "Harassed", "Weakened", "Worried" ], comment = Nothing } )
        , ( 51, QandA { question = "The busy city street produced a CACOPHONY.", answers = [ "A terrible, unnatural smell", "A relentless crowd", "A harsh mixture of sounds", "An area where crowds gather" ], comment = Just "A similar word is RACKET." } )
        , ( 76, QandA { question = "Jason was EBULLIENT now that school was out for the summer.", answers = [ "Depressed", "Bored", "Saddened", "Bubbling with excitement" ], comment = Just "Comparable words are SPIRITED and EFFERVESCENT." } )
        , ( 2, QandA { question = "Which word matches the definition: To weaken; to cripple.", answers = [ "Debilitate", "Annihilate", "Eradicate", "Extirpate" ], comment = Nothing } )
        , ( 27, QandA { question = "Which word describes something as LUDICROUS?", answers = [ "Facetious", "Farcical", "Fecund", "Fastidious" ], comment = Nothing } )
        , ( 52, QandA { question = "Aunt Elma was the most GARRULOUS of all of Steven's relatives.", answers = [ "Obnoxious", "Introverted", "Talkative", "Untidy" ], comment = Just "Comparable words are VERBOSE and BABBLING." } )
        , ( 77, QandA { question = "Which sentence uses the word HARBINGER correctly?", answers = [ "As a painter, Billy was a harbinger, but his sculpting skills lacked.", "Randy used a harbinger to catch the fish in the stream.", "The kids ate a harbinger of candy on Holloween day!", "Dark clouds are the harbinger of bad weather." ], comment = Nothing } )
        , ( 3, QandA { question = "Which of the following objects can be described as INCANDESCENT?", answers = [ "Light bulb", "Shiny car", "Old pair of shoes", "The Moon" ], comment = Just "A similar word is LIGHTED." } )
        , ( 28, QandA { question = "Susan JUXTAPOSED the five dollar bill and the counterfeit.", answers = [ "Switched them without anyone noticing", "Placed them side by side (for comparison)", "Took them without anyone noticing", "Looked at them through a bright light" ], comment = Nothing } )
        , ( 53, QandA { question = "Becky's clarinet playing was MELLIFLUOUS.", answers = [ "Poorly heard", "Sour", "Sweetly flowing, harmonious", "Delivered without feeling" ], comment = Just "A similar word is MELODIOUS." } )
        , ( 78, QandA { question = "What's another word for MENDACIOUS?", answers = [ "Complacent", "Forgiving", "Warlike", "Dishonest" ], comment = Just "Comparable words are UNTRUTHFUL and DECEITFUL." } )
        , ( 4, QandA { question = "Which of the following objects can be described as MONOLITHIC?", answers = [ "A giant boulder rooted in the Earth", "A crying baby", "A snowflake", "A bar of solid lead" ], comment = Nothing } )
        , ( 29, QandA { question = "Gale's ideas were so NEBULOUS no one listened to her. In other words, Gale...", answers = [ "Could not express herself well", "Only had vague ideas, without distinct points of contention", "Bored everyone she talked to", "Was too smart for anyone to understand" ], comment = Just "Comparable words are INDISTINCT and AMBIGUOUS." } )
        , ( 54, QandA { question = "Which of the following words means: To abstain; to refrain from.", answers = [ "Forsake", "Disclaim", "Forbear", "Disavow" ], comment = Nothing } )
        , ( 79, QandA { question = "Chana is so pretty that her suitors are often driven to _________ acts of devotion.", answers = [ "Fastidious", "Facile", "Fecund", "Fatuous" ], comment = Nothing } )
        , ( 5, QandA { question = "To make a situation worse is to ___________ it.", answers = [ "Exacerbate", "Exasperate", "Exonerate", "Expatraite" ], comment = Nothing } )
        , ( 30, QandA { question = "A PARADIGM is a...", answers = [ "A true statement that seems to contradict itself", "Model", "A magical change in form", "An illegal act, especially against one's country" ], comment = Just "Comparable words are BASIS and EXAMPLE." } )
        , ( 55, QandA { question = "There was a PAUCITY of good seats at the theater.", answers = [ "Abundance", "Profusion", "Scarcity", "Waste" ], comment = Just "Comparable words are LACK and ABSENCE." } )
        , ( 80, QandA { question = "Foreign word, match the definition: A PROPOS", answers = [ "Obligatory; required by fashion or custom", "Up to date; informed", "Outside; in the fresh air", "Pertinent; to the point" ], comment = Just "At her school, Judy gave a speech that was a propos." } )
        , ( 6, QandA { question = "Which foreign word means an embarrassing social mistake?", answers = [ "Faux pas", "Laissez-faire", "Nolo contendere", "Semper fidelis" ], comment = Nothing } )
        , ( 31, QandA { question = "Foreign word, match the definition: RAISON D'ETRE", answers = [ "Only means of happiness", "Reason for being", "Answer to all problems", "Solution to all problems" ], comment = Just "For many people, money is their raison d'etre." } )
        , ( 56, QandA { question = "Someone asks you for the time, and you reply with:   outside.", answers = [ "De facto", "Vernacular", "Non sequitur", "Oxymoron" ], comment = Nothing } )
        , ( 81, QandA { question = "The shuttle lifted into orbit in the morning, and reached the APOGEE of its orbit seven hours later.", answers = [ "Point in orbit where it perfectly matches the Earth's rotation rate", "Critical point", "Lowest point", "Highest point" ], comment = Just "This game was published by the company Apogee Software Productions." } )
        , ( 7, QandA { question = "His MALADROIT handling of the situation produced the expected outcome.", answers = [ "Awkward", "Unpardonable", "Skillful", "Unjustified" ], comment = Just "Comparable words are CLUMSY and INEPT." } )
        , ( 32, QandA { question = "The politician was worried of charges of NEPOTISM.", answers = [ "Stirring up controversy", "Favoritism shown to relatives", "Misappropriation of public funds", "Indecisiveness to hear the opinions of others" ], comment = Just "Nepotism is very similar to the \"buddy-buddy\" system of hiring friends." } )
        , ( 57, QandA { question = "The young politician needed to tone down her VERBOSITY!", answers = [ "Pomposity", "Sense of humor", "Wordiness", "Use of overly long words" ], comment = Just "A similar word is CIRCUMLOCUTION." } )
        , ( 82, QandA { question = "The man handled the rude waiter with SAVOIR FAIRE.", answers = [ "With a public scolding", "With a heavy hand", "With much deserved animosity", "With social tact" ], comment = Nothing } )
        , ( 8, QandA { question = "Roy felt VICARIOUS pleasure through his wife's art success.", answers = [ "Experienced through another", "Unnatural or unwholesome", "Much-needed", "Distorted" ], comment = Just "A similar word is INDIRECT." } )
        , ( 33, QandA { question = "A researcher who depends on SERENDIPITY cannot anticipate consistent success.", answers = [ "Persistence in the face of repeated failure", "Accidental good fortune; unexpected discoveries", "Pure luck", "Self-composure under trying circumstances" ], comment = Nothing } )
        , ( 58, QandA { question = "When indisputable evidence was shown to the witness, he sat AGAPE, unable to utter a sound!", answers = [ "Staring", "Grief-stricken", "Open-mouthed", "Deeply resigned" ], comment = Nothing } )
        , ( 83, QandA { question = "The recipe calls for the addition of CROUTONS just before serving.", answers = [ "Minced chives", "Grated raw vegetables", "Melted cheeses", "Cubes of toasted or fried bread" ], comment = Nothing } )
        , ( 9, QandA { question = "You can count on being CASTIGATED by your boss if your job performance remains at its present level.", answers = [ "Severely criticized", "Recommended for promotion", "Publicly commended", "Demoted" ], comment = Just "A similar word is ADMONISHED." } )
        , ( 34, QandA { question = "As the campaign dragged into its final weeks, the candidate more and more was given to EGREGIOUS blunders in his speeches.", answers = [ "Forgivable", "Outrageous", "Unpreventable", "Untimely" ], comment = Just "A similar word is EXCESSIVE." } )
        , ( 59, QandA { question = "A ZUCCHETTO is a small skullcap worn by...", answers = [ "A technician using delicate equipment", "An Italian fighter pilot", "A member of the clergy", "A member of a surgical team" ], comment = Nothing } )
        , ( 84, QandA { question = "The majority opinion of those who did not know him well, perceived him as a TACITURN individual.", answers = [ "Given to moodiness", "Talkative", "Trustworthy", "Given to saying little" ], comment = Just "Comparable words are SILENT and CLOSE-MOUTHED." } )
        , ( 10, QandA { question = "The REGIMEN he encountered turned out to be more than he had expected.", answers = [ "Regulated course of training", "Military discipline", "Autocratic rule", "Rules of the game" ], comment = Nothing } )
        , ( 35, QandA { question = "As a condition to agreeing to the attorney's suggestion that the suit be dropped, Sue insisted on a QUID PRO QUO.", answers = [ "Reduction of the lawyer's fees", "Something in exchange for something else", "Advice from a third party", "Prompt and complete apology" ], comment = Nothing } )
        , ( 60, QandA { question = "The sport of tennis is thought to be a SALUBRIOUS way to spend one's free time.", answers = [ "Unproductive", "Useful", "Conducive to health", "Demanding but satisfying" ], comment = Just "A similar word is INVIGORATING." } )
        , ( 85, QandA { question = "The containers were found to be sufficiently CAPACIOUS for your needs.", answers = [ "Reliable", "Versity", "Well suited", "Of large capacity" ], comment = Just "Comparable words are ROOMY and SPACIOUS." } )
        , ( 11, QandA { question = "Upon entering the school building, you were struck by the DECORUM of the students.", answers = [ "Correctness in behavior", "Willingness to help one another", "Artistic ability", "Outlandish behavior" ], comment = Nothing } )
        , ( 36, QandA { question = "ABERRANT behavior is characteristic of members of that age group.", answers = [ "Aggressively hostile in manner", "Deviating from what is normal", "Falling silent to avoid unpleasantness", "Suggesting open disagreement" ], comment = Just "Comparable words are ERRANT and DIVERGENT." } )
        , ( 61, QandA { question = "Inevitably there came a time when her FOREBODINGS proved impossible to contain.", answers = [ "Feelings of exultation", "Exaggerated fears", "Feelings that trouble is coming", "Feelings of excitement" ], comment = Nothing } )
        , ( 86, QandA { question = "A person who is a GADFLY is...", answers = [ "Habitually busy", "A exceptionally hard worker", "A careful worker", "A persistently annoying critic" ], comment = Nothing } )
        , ( 12, QandA { question = "The speaker's MALAPROPISMS evoked laughter among most of those present, but her supporters anguished in complete silence.", answers = [ "Comical confusion of words", "Ridiculous claims", "Transparent exaggerations", "Unfortunate errors in punctuation" ], comment = Nothing } )
        , ( 37, QandA { question = "Everyone agreed she would never do as a RACONTEUR, even though she thought of herself as outstanding in that role.", answers = [ "Labor mediator", "Teller of anecdotes", "Stock market expert", "Financial analyst" ], comment = Nothing } )
        , ( 62, QandA { question = "Gary's friends were astonished to find how soon after marriage he became UXORIOUS.", answers = [ "Loving and caring", "Inconsiderate", "Overly submissive", "Detached from previous activities" ], comment = Nothing } )
        , ( 87, QandA { question = "The commitee's SEDULOUS pursuit of all the facts in the matter brought favorable comment in the press.", answers = [ "Rapid and thorough", "Intelligent and skillful", "Considerate and insightful", "Persevering and diligent" ], comment = Just "Comparable words are ASSIDUOUS and INDUSTRIOUS." } )
        , ( 13, QandA { question = "Investigators concluded that someone in the mail room had been FILCHING postage stamps.", answers = [ "Stealing", "Selling", "Collecting", "Canceling" ], comment = Just "A similar word is PURLOINING." } )
        , ( 38, QandA { question = "By the time the merger was concluded, the firm had earned a reputation for CALLOUS treatment of its employees.", answers = [ "Objective", "Unsympathetic", "Humane", "Cautious" ], comment = Just "Similar words are INDIFFERENT and HARDENED." } )
        , ( 63, QandA { question = "All members of the caucus agreed it would make good sense to ESPOUSE the radical position.", answers = [ "Investigate", "Ignore", "Support", "Oppose" ], comment = Just "Similar words are ADVOCATE and UPHOLD." } )
        , ( 88, QandA { question = "Eventually, the reporter's APOCRYPHAL account of the scandal in government gained wide acceptance.", answers = [ "Factual", "Exaggerated", "Inaccurate", "Invented" ], comment = Just "Similar words are BOGUS and FRAUDULENT." } )
        , ( 14, QandA { question = "Two of the bigger boys are said to have PUMMELED the smallest boy in the class while the other students watched.", answers = [ "Struck repeatedly", "Tormented", "Insulted", "Teased mercilessly" ], comment = Just "A similar word is BATTERED." } )
        , ( 39, QandA { question = "The program concluded with yet another OROTUND statement from the chairman of the board.", answers = [ "Wordy", "Pretentious", "Concise and well-reasoned", "Anecedotal" ], comment = Nothing } )
        , ( 64, QandA { question = "Many political scientists have suggested that our government has become a LEVIATHAN.", answers = [ "Threat to survival", "Model for others to follow", "Something of enormous size", "Body interested primarily in self-perpetuation" ], comment = Nothing } )
        , ( 89, QandA { question = "The sales presentation began with a COGENT analysis of the situation.", answers = [ "Simplified", "Clever", "Thoughtful", "Convincing" ], comment = Just "Comparable words are INFLUENTIAL and EFFECTIVE." } )
        , ( 15, QandA { question = "Have you ever known someone who lived by a set of truly IRREFRAGABLE principles?", answers = [ "Unalterable", "Unimpeachable", "Unfounded", "Imperfect" ], comment = Just "This word should not be confused with IRREPROACHABLE or IRREFUTABLE!" } )
        , ( 40, QandA { question = "They WRITHED in pain during the entire time we were with them.", answers = [ "Silently suffered", "Twisted about", "Cried out", "Prayed for relief" ], comment = Just "The root of this word is WRITHE." } )
        , ( 65, QandA { question = "An UNMITIGATED awkwardness characterizes most people of our age.", answers = [ "Unimaginable", "Unseemly", "Unqualified", "Unnatural" ], comment = Just "Comparable words are ABSOLUTE and CONSUMMATE." } )
        , ( 90, QandA { question = "The variety of VIVIPAROUS animals present in that environment astonished most observers.", answers = [ "Warm-blooded", "Aquatic", "Fur-bearing", "Producing living offspring" ], comment = Just "As opposed to egg-laying creatures." } )
        , ( 16, QandA { question = "Who would have expected a person so young to deliver a EULOGY so tender and moving.", answers = [ "Funeral oration", "Valedictory (farewell)", "Keynote speech", "Introductory statement" ], comment = Just "A similar word is TRIBUTE." } )
        , ( 41, QandA { question = "The reviews for the movie run the GAMUT from faint praise to resounding acclaim!", answers = [ "Ordeal", "Entire range", "Anticipated reaction", "Critical response" ], comment = Nothing } )
        , ( 66, QandA { question = "I parted company with my friends because they ultimately proved INTRANSIGENT.", answers = [ "Insensitive", "Lacking in ambition", "Uncompromising", "Unwilling to improve" ], comment = Just "A similar word is DOGMATIC." } )
        , ( 91, QandA { question = "It seemed likely the two factions would never COALESCE.", answers = [ "Recognize common danger", "Settle disputes", "Abandon a common goal", "Unite for a common purpose" ], comment = Just "A similar word is COMMINGLE." } )
        , ( 17, QandA { question = "My neighbor's dog is known throughout the neighborhood for its BELLICOSITY.", answers = [ "Inclination to fight", "Friendliness", "Ability to frighten strangers", "Striking beauty" ], comment = Just "Derived from the root word BELLICOSE." } )
        , ( 42, QandA { question = "The business showed an INFINITESIMAL profit last year!", answers = [ "Excellent", "Immeasurably small", "Extraordinary", "Relatively poor" ], comment = Just "Comparable words are MINUTE and DIMINUTIVE." } )
        , ( 67, QandA { question = "Everyone marvels at her ability to construct lengthy PALINDROMES.", answers = [ "Glittering examples of literary parody", "Apt metaphors", "Words or sentences reading the same backward and forward", "Evocative passages committed to memory" ], comment = Just "For example, the word KAYAK (which is not too lengthy, in fact)." } )
        , ( 92, QandA { question = "Sue's PRETERNATURAL intelligence became immediately apparent to all members of the board.", answers = [ "Less than adequate", "Adequate", "Admirable", "Extraordinary" ], comment = Just "Comparable words are SUPERNATURAL and PECULIAR." } )
        , ( 18, QandA { question = "His GAFFES were memorable but did nothing to advance his candidacy.", answers = [ "Political blunders", "Clever statements", "Indiscreet remarks", "Personal appearances" ], comment = Nothing } )
        , ( 43, QandA { question = "The characteristic PANACHE he once displayed was no longer in evidence.", answers = [ "Lack of confidence", "Confident stylish manner", "Absorption in self", "Unawareness of the feelings of others" ], comment = Nothing } )
        , ( 68, QandA { question = "Holders of credit cards must beware of waking up one morning and finding themselves in a financial QUAGMIRE.", answers = [ "Nightmare", "State of bankruptcy", "Very difficult situation", "Condition in which further purchases are impossible" ], comment = Just "Comparable words are MARSH and BOG." } )
        , ( 93, QandA { question = "You should always be wary of people who pay EFFUSIVE compliments.", answers = [ "Ill-considered", "Left-handed", "Obviously unearned", "Unduly demonstrative" ], comment = Just "A similar word is GARRULOUS." } )
        , ( 19, QandA { question = "Jane's instructor said her HYPERBOLE was unacceptable.", answers = [ "Extravagant statement not meant to be taken seriously", "Long-winded excuse", "Outburst of irrational behavior", "Geometric proof" ], comment = Just "A similar word is OVERSTATEMENT." } )
        , ( 44, QandA { question = "When towns BURGEON, we must question whether the advantages outweigh the disadvantages.", answers = [ "Lose original character", "Begin to grow rapidly", "Build indiscriminately", "Run out of room to expand" ], comment = Just "A similar word is BLOOM." } )
        , ( 69, QandA { question = "Everyone expected she would prove ADAMANT in refusing to grant interviews.", answers = [ "Sincere", "Offensive in manner", "Quite firm", "Correct in judgement" ], comment = Just "Comparable words are UNWAVERING and RESOLUTE." } )
        , ( 94, QandA { question = "The TETHER we bought broke after just a few days' use.", answers = [ "Metal or leather support for a horseback rider's feet", "Highest bar of a fence used for enclosing young horses", "Leather strip used as a lash or fastening", "Rope or chain used to fasten a grazing animal" ], comment = Nothing } )
        , ( 20, QandA { question = "The last thing we expected was a series of completely INGENUOUS responses to our questions.", answers = [ "Frank", "Deceptive", "Clever", "Ambiguous" ], comment = Just "Comparable words are CANDID and STRAIGHTFORWARD." } )
        , ( 45, QandA { question = "By then, we all thought she was resigned to her husband's habitual CARPING.", answers = [ "Harsh criticism", "Petty faultfinding", "Scrimping", "Uncontrolled spending" ], comment = Nothing } )
        , ( 70, QandA { question = "How many times did Tom's father say to his dog, \"You are the BANE of my life\"?", answers = [ "Single most important factor", "Least important factor", "Cause of trouble", "Principle financial drain" ], comment = Just "A similar word is TORMENT." } )
        , ( 95, QandA { question = "For a while at least, his JEJUNE behavior made him the center of attention.", answers = [ "Unconventional", "Precocious", "Astonishing", "Childish" ], comment = Just "A similar word is UNINTERESTING." } )
        , ( 21, QandA { question = "Edith's associates looked upon her as their PALADIN.", answers = [ "Champion of a cause", "Benevolent dictator", "Principal adversary", "Intellectual leader" ], comment = Just "Comparable words are FIGHTER and DEFENDER." } )
        , ( 46, QandA { question = "His RIBALD jokes quickly made their way through the company.", answers = [ "Lacking humor", "Coarsely humorous", "One-liners", "Stale" ], comment = Just "Comparable words are VULGAR and BAWDY." } )
        , ( 71, QandA { question = "Edgar's PRETENTIOUS manner actually helped his career, much to the amazement of his peers.", answers = [ "Offensive", "Unrealistic", "Showy", "Dishonest" ], comment = Just "Comparable words are OSTENTATIOUS and POMPOUS." } )
        , ( 96, QandA { question = "The effects of a TSUMAMI soon become apparent.", answers = [ "First tropical storm of the season", "Major earthquake in Japan", "Volcanic eruption", "Series of huge sea waves" ], comment = Nothing } )
        , ( 22, QandA { question = "Much of the debate was no more than LOGOMACHY.", answers = [ "Dispute over words", "Scholarly hairsplitting", "Verbal abuse", "General lack of understanding" ], comment = Just "Hopefully, WORD WHIZ will help clear up some of the confusion!" } )
        , ( 47, QandA { question = "Nothing you say will BESMIRCH their reputations.", answers = [ "Destroy", "Soil", "Change", "Help" ], comment = Nothing } )
        , ( 72, QandA { question = "Steve came upon a fascinating drawing of a CENTAUR in the artist's notebook.", answers = [ "Roman soldier", "Giant prehistoric lizard", "Fabled half-man half-horse", "Any soldier or guard on duty" ], comment = Nothing } )
        , ( 97, QandA { question = "The surgeon had to also remove part of the MANDIBLE.", answers = [ "Bone of the wrist", "Bone of the ankle", "Bone of the back", "Bone of the lower jaw" ], comment = Nothing } )
        , ( 23, QandA { question = "His QUERULOUSNESS did not improve his standing in the group.", answers = [ "Habitual complaining", "Questioning attitude", "Inclination to pick fights", "Exaggerated pettiness" ], comment = Just "From the root word QUERULOUS." } )
        , ( 48, QandA { question = "The man and woman's meeting was FORTUITOUS.", answers = [ "Predestined", "Happening by chance", "Carefully planned", "Highly productive" ], comment = Just "A similar word is LUCKY." } )
        , ( 73, QandA { question = "Within minutes, as my guide predicted, a beggar ACCOSTED me.", answers = [ "Asked for money", "Insulted", "Approached and addressed", "Intimidated" ], comment = Just "A similar word is CONFRONTED." } )
        , ( 98, QandA { question = "She was undeniably the EPITOME of fairness combined with resolve.", answers = [ "Final judge", "Poorest example", "Exact opposite", "Embodiment" ], comment = Just "A similar word is ESSENCE." } )
        , ( 24, QandA { question = "Extent and duration of addiction were the PARAMETERS of greatest interest to the researchers.", answers = [ "Quantifiable characteristics", "Helpful indicators", "Useful statistical data", "Experimental assumptions" ], comment = Just "Comparable words are CRITERION and GUIDELINES." } )
        , ( 49, QandA { question = "From the start, the comedian's INANE patter brought nothing but occasional laughter from the audience.", answers = [ "Off-color", "Lacking sense", "Inexpertly delivered", "Somewhat funny" ], comment = Just "Comparable words are SILLY and ABSURD." } )
        , ( 74, QandA { question = "Throughout Margie's career, she was considered one of the country's foremost BIBLIOPHILES.", answers = [ "Biblical scholars", "Reference librarians", "Book collectors", "Authors of books on religion" ], comment = Nothing } )
        , ( 99, QandA { question = "Most of us agree that nothing can EXTENUATE the president's behavior in that matter.", answers = [ "Rationally explain the reasons behind", "Overcome the consequences of", "Make fully acceptable", "Lessen seriousness of by providing a partial excuse" ], comment = Just "A similar word is MITIGATE." } )
        , ( 25, QandA { question = "Wouldn't it be fun to have a GECKO as a house pet?", answers = [ "Type of harmless lizard", "Type of tropical bird", "Type of freshwater fish", "Type of tropical fish" ], comment = Nothing } )
        , ( 50, QandA { question = "JOCULAR comments about absent members of the family were common at their dinner table.", answers = [ "Cruel", "Joking", "Gossipy", "Unflattering" ], comment = Just "Comparable words are JESTING and COMICAL." } )
        , ( 75, QandA { question = "O'Connor's VIGNETTE demonstrated once again her outstanding ability as a writer of fiction.", answers = [ "Short novels", "Brief narratives", "Character sketches", "Intricate plots" ], comment = Nothing } )
        , ( 100, QandA { question = "His FOIBLES were overlooked by the great majority of his patients.", answers = [ "Prying manners", "Personal habits", "Errors in judgement", "Harmless flaws in character" ], comment = Just "Comparable words are IMPERFECTIONS and DEFECTS." } )
        ]
