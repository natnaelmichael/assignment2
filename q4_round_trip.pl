% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Natnael Michael
%%%%% STUDENT ID: 500982899
%%%%%
%%%%% NAME: Taarush Jain
%%%%% STUDENT ID: 501010905
%%%%%
%%%%% NAME: Vladimirs Kalinins
%%%%% STUDENT ID: 501291214
%
% Add the required statements in the q4_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q4_kb_import
% The following line will import a file called "trip_kb.pl". 
% Thus, you can create such a file to test your program.
% You can feel free tovedit this line if you want to import and test 
% on different KBs. We will ignore this section when testing your code, 
% and instead test on our own KBs.
:- [trip_kb].



%%%%% SECTION: q4_day_helper
% This section has statements identifying all valid days in the month of October
% DO NOT MODIFY THIS SECTION
day(1).  day(2).  day(3).  day(4).  day(5).  day(6).  day(7).  day(8).  day(9).  day(10).
day(11).  day(12).  day(13).  day(14).  day(15).  day(16).  day(17).  day(18).  day(19).  day(20).
day(21).  day(22).  day(23).  day(24).  day(25).  day(26).  day(27).  day(28).  day(29).  day(30).
day(31).


%%%%% SECTION: q4_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: roundTrip(City, Start, End, NumFlights, FlightDates, Cities, Hotels, Cost)

roundTrip(City, Start, End, NumFlights, FlightDates, Cities, Hotels, Cost) :-
    NumFlights >= 2,
    tripFrom(City, Start, City, End, NumFlights, [City], FlightDates, Cities, Hotels, Cost).

% tripFrom(From, Date, Home, End, NumFlights, Visited, FlightDates, Cities, Hotels, Cost):
% there is a sequence of exactly NumFlights flights that leaves From on Date and whose
% last flight arrives in Home on End. Visited lists the cities already visited (including
% Home); none of the stops along the way may be one of them, so no city is visited twice
% and Home is only returned to on the last flight. FlightDates, Cities and Hotels are the
% flight dates, the arrival city of each flight, and the hotel stayed at in each stop, all
% in chronological order. Cost is the total cost of the flights and hotels.
tripFrom(From, End, Home, End, 1, _, [End], [Home], [], Cost) :-
    flight(From, Home, End, Cost).
tripFrom(From, Date, Home, End, NumFlights, Visited,
         [Date | FlightDates], [Stop | Cities], [Hotel | Hotels], Cost) :-
    NumFlights > 1,
    flight(From, Stop, Date, FlightCost),
    not myMember(Stop, Visited),
    day(NextDate), Date < NextDate, NextDate =< End,
    stayCost(Hotel, Stop, Date, NextDate, HotelCost),
    RemainingFlights is NumFlights - 1,
    tripFrom(Stop, NextDate, Home, End, RemainingFlights, [Stop | Visited],
             FlightDates, Cities, Hotels, RestCost),
    Cost is FlightCost + HotelCost + RestCost.

% stayCost(Hotel, City, CheckinDate, CheckoutDate, Cost): staying at Hotel in City from
% CheckinDate to CheckoutDate (one hotel for every night) costs Cost. (From Assignment 1.)
stayCost(Hotel, City, CheckinDate, CheckoutDate, Cost) :-
    CheckoutDate is CheckinDate + 1,
    hasRoom(Hotel, City, CheckinDate, Cost).
stayCost(Hotel, City, CheckinDate, CheckoutDate, Cost) :-
    NextDate is CheckinDate + 1, NextDate < CheckoutDate,
    hasRoom(Hotel, City, CheckinDate, NightCost),
    stayCost(Hotel, City, NextDate, CheckoutDate, RestCost),
    Cost is NightCost + RestCost.

% myMember(X, List): X is an element of List.
myMember(X, [X | _]).
myMember(X, [_ | Rest]) :- myMember(X, Rest).
