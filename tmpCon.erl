%https://www.javaworld.com/article/2077999/understanding-actor-concurrency--part-1--actors-in-erlang.html

-module(tmpCon).
-export([tmpCon/0]).

tmpCon() ->
	receive
		{toF, C} ->
			io:format("~p C is ~p F~n", [C, 32+C*9/5]),
			tmpCon();
		{toC, F} ->
			io:format("~p F is ~p C~n", [F, (F-32)*5/9]),
			tmpCon();
		{stop} ->
			io:format("stopping");
		Other ->
			io:format("Unknown: ~p~n", [Other]),
			tmpCon()
	end.
