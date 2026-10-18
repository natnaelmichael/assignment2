% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q6_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q6_kb_import
% The following line will import a file called "trip_kb.pl". 
% Thus, you can create such a file to test your program.
% You can feel free tovedit this line if you want to import and test 
% on different KBs. We will ignore this section when testing your code, 
% and instead test on our own KBs.
:- [trip_kb].



%%%%% SECTION: q6_day_helper
% This section has statements identifying all valid days in the month of October
% DO NOT MODIFY THIS SECTION
day(1).  day(2).  day(3).  day(4).  day(5).  day(6).  day(7).  day(8).  day(9).  day(10).
day(11).  day(12).  day(13).  day(14).  day(15).  day(16).  day(17).  day(18).  day(19).  day(20).
day(21).  day(22).  day(23).  day(24).  day(25).  day(26).  day(27).  day(28).  day(29).  day(30).
day(31).


%%%%% SECTION: q6_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: cheapestHotel(City, CheckInDate, CheckOutDate, Stay)
%%%%% Uses the term stay(HotelName, City, CheckInDate, CheckOutDate, TotalCost)

%% cheapestHotel(Stays, Cheapest)
%  Stays    : a list of stay(HotelName, City, CheckIn, CheckOut, Cost) terms
%  Cheapest : the stay in the list with the smallest TotalCost
%
%  The list may be in any order and the stays may overlap or share
%  cities.  Fails for the empty list (nothing is the cheapest of nothing).
cheapestHotel([Stay | Rest], Cheapest) :-
    cheapestFrom(Rest, Stay, Cheapest).

%% cheapestFrom(Remaining, BestSoFar, Cheapest)
cheapestFrom([], Best, Best).
cheapestFrom([Stay | Rest], Best, Cheapest) :-
    minStay(Stay, Best, NewBest),
    cheapestFrom(Rest, NewBest, Cheapest).

%% minStay(Stay1, Stay2, Min) - Min is the cheaper of the two stays.
minStay(Stay1, Stay2, Stay1) :-
    stayCost(Stay1, Cost1),
    stayCost(Stay2, Cost2),
    Cost1 < Cost2.
minStay(Stay1, Stay2, Stay2) :-
    stayCost(Stay1, Cost1),
    stayCost(Stay2, Cost2),
    not Cost1 < Cost2.

%% Extract the total cost field of a stay term.
stayCost(stay(_, _, _, _, Cost), Cost).

