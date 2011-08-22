-module(briscola_utility).
-export([get_points/1]).

-include("../include/briscola.hrl").

get_points(Cards) ->
    get_points(Cards, 0).

get_points([], Points) ->
    Points;

get_points([Card | Cards], PartialPoints) ->
    NewPoints = case Card#card.value of
                    1 ->
                        PartialPoints + 11;
                    3 ->
                        PartialPoints + 10;
                    8 ->
                        PartialPoints + 2;
                    9 ->
                        PartialPoints + 3;
                    10 ->
                        PartialPoints + 4;
		    _ ->
			PartialPoints
                end,
    get_points(Cards, NewPoints).
