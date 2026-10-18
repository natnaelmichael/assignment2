% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Natnael Michael
%%%%% STUDENT ID: 500982899
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
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

