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
% Add the required statements in the q3_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q3_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: containsAny(Items, Contains, Indices)


% containsAny(Items, Contains, Indices): Indices are the (0-based) positions of the
% elements of Items that also appear in Contains.
containsAny(Items, Contains, Indices) :-
    indicesFrom(Items, Contains, 0, Indices).

% indicesFrom(Items, Contains, Index, Indices): same as containsAny, except the first
% element of Items is at position Index.
indicesFrom([], _, _, []).
indicesFrom([Item | Rest], Contains, Index, [Index | Indices]) :-
    myMember(Item, Contains),
    NextIndex is Index + 1,
    indicesFrom(Rest, Contains, NextIndex, Indices).
indicesFrom([Item | Rest], Contains, Index, Indices) :-
    not myMember(Item, Contains),
    NextIndex is Index + 1,
    indicesFrom(Rest, Contains, NextIndex, Indices).

% myMember(X, List): X is an element of List. It succeeds at most once, even if X
% appears in List several times, so containsAny does not repeat answers.
myMember(X, [X | _]).
myMember(X, [Y | Rest]) :- not X = Y, myMember(X, Rest).
