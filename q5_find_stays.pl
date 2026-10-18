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
% Add the required statements in the q5_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q5_kb_import
% The following line will import a file called "trip_kb.pl". 
% Thus, you can create such a file to test your program.
% You can feel free tovedit this line if you want to import and test 
% on different KBs. We will ignore this section when testing your code, 
% and instead test on our own KBs.
:- [trip_kb].



%%%%% SECTION: q5_day_helper
% This section has statements identifying all valid days in the month of October
% DO NOT MODIFY THIS SECTION
day(1).  day(2).  day(3).  day(4).  day(5).  day(6).  day(7).  day(8).  day(9).  day(10).
day(11).  day(12).  day(13).  day(14).  day(15).  day(16).  day(17).  day(18).  day(19).  day(20).
day(21).  day(22).  day(23).  day(24).  day(25).  day(26).  day(27).  day(28).  day(29).  day(30).
day(31).


%%%%% SECTION: q5_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: findStays(Dates, Cities, Stays)
%%%%% Uses the term stay(HotelName, City, CheckInDate, CheckOutDate, TotalCost)

%% findStays(Dates, Cities, Stays)
%  Dates  : list of travel days (chronological)
%  Cities : cities visited, one per travel day (chronological)
%  Stays  : list of stay(HotelName, City, CheckIn, CheckOut, TotalCost)
%
%  A stay covers the time between two consecutive travel days, and the
%  traveller stays in one hotel for that entire period.  With N travel
%  days there are N-1 stays (no hotel is needed at the final city).
findStays(Dates, Cities, Stays) :-
    validTrip(Dates, Cities),
    buildStays(Dates, Cities, Stays).

%% A valid query has a date for every city, at least two travel days,
%% and strictly increasing dates.
validTrip(Dates, Cities) :-
    sameLength(Dates, Cities),
    atLeastTwo(Dates),
    increasing(Dates).

sameLength([], []).
sameLength([_|D], [_|C]) :-
    sameLength(D, C).

atLeastTwo([_, _| _]).

increasing([_]).
increasing([D1, D2 | Rest]) :-
    D1 < D2,
    increasing([D2 | Rest]).

%% Walk consecutive (date, city) pairs.  There is no stay after the
%% final travel day, hence the [] / [] base case.
buildStays([_], [_], []).
buildStays([CheckIn, CheckOut | RestDates],
           [City | RestCities],
           [stay(Hotel, City, CheckIn, CheckOut, TotalCost) | RestStays]) :-
    roomRange(Hotel, City, CheckIn, CheckOut, TotalCost),
    buildStays([CheckOut | RestDates], RestCities, RestStays).

%% Find one hotel in City that has a room for every night from CheckIn
%% up to (but not including) CheckOut, and sum those nightly prices.
roomRange(Hotel, City, CheckIn, CheckOut, TotalCost) :-
    hasRoom(Hotel, City, CheckIn, _),
    rangeCost(Hotel, City, CheckIn, CheckOut, TotalCost).

rangeCost(_, _, CheckOut, CheckOut, 0).
rangeCost(Hotel, City, Day, CheckOut, TotalCost) :-
    Day < CheckOut,
    hasRoom(Hotel, City, Day, Price),
    NextDay is Day + 1,
    rangeCost(Hotel, City, NextDay, CheckOut, RestCost),
    TotalCost is Price + RestCost.



