% trip_kb.pl
% Shared test knowledge base for questions 4, 5 and 6.
% This file is NOT part of the submission. It only exists so that the
% q4/q5/q6 files can be imported and tested with ":- [trip_kb].".
%
% It uses the same predicates as Assignment 1:
%   flight(City1, City2, Date, Price)
%   hasRoom(Name, City, Date, Price)
%   ticket(Name, City, Date, Price)

%%%%% FLIGHTS
% The example from the assignment:
%   toronto --15--> montreal --17--> quebec_city --20--> toronto
flight(toronto, montreal, 15, 200).
flight(montreal, quebec_city, 17, 150).
flight(quebec_city, toronto, 20, 250).

% A second valid round trip through kingston (used to test "More"):
%   toronto --15--> kingston --16--> montreal --18--> kingston --19--> toronto
flight(toronto, kingston, 15, 100).
flight(kingston, montreal, 16, 90).
flight(montreal, kingston, 18, 90).
flight(kingston, toronto, 19, 100).

% Extra flights so that some cities can be reached by more than one route.
flight(toronto, montreal, 16, 220).
flight(montreal, toronto, 19, 210).

%%%%% HOTEL ROOMS (one fact per available night)
% The Hilton in Montreal, available the 15th and 16th.
hasRoom(the_hilton, montreal, 15, 195).
hasRoom(the_hilton, montreal, 16, 195).

% The Sheraton in Quebec City, available the 17th to 19th.
hasRoom(the_sheraton, quebec_city, 17, 125).
hasRoom(the_sheraton, quebec_city, 18, 125).
hasRoom(the_sheraton, quebec_city, 19, 125).

% A cheaper Montreal option, listed after the Hilton so the documented
% example is still the first solution found.
hasRoom(motel_six, montreal, 15, 80).
hasRoom(motel_six, montreal, 16, 80).

% A more expensive Montreal option.
hasRoom(the_ritz, montreal, 15, 300).
hasRoom(the_ritz, montreal, 16, 300).

% A second hotel in Quebec City.
hasRoom(auberge, quebec_city, 17, 110).
hasRoom(auberge, quebec_city, 18, 110).
hasRoom(auberge, quebec_city, 19, 110).

% Rooms matching the stays used as the example in question 6.
% Marriott in Toronto, 20th to 24th (a 20 -> 25 stay totals 1000).
hasRoom(the_marriott, toronto, 20, 200).
hasRoom(the_marriott, toronto, 21, 200).
hasRoom(the_marriott, toronto, 22, 200).
hasRoom(the_marriott, toronto, 23, 200).
hasRoom(the_marriott, toronto, 24, 200).

% Holiday Inn in Hamilton, 25th to 28th (a 25 -> 29 stay totals 400).
hasRoom(holiday_inn, hamilton, 25, 100).
hasRoom(holiday_inn, hamilton, 26, 100).
hasRoom(holiday_inn, hamilton, 27, 100).
hasRoom(holiday_inn, hamilton, 28, 100).

%%%%% TICKETS (not needed by q4/q5/q6, included for completeness)
ticket(via_rail, montreal, 15, 90).
ticket(via_rail, quebec_city, 17, 60).
