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
% Add the required statements in the q2_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q2_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: polyCalc(Coeffs, VarValue, Result)


% An empty polynomial has value 0.
polyCalc([], _, 0).
% For c0 + c1*x + c2*x^2 + ..., factor out x from every term after the first:
%   value = c0 + x * (c1 + c2*x + ...)
% so the value of the list is its first coefficient plus x times the value of the rest.
polyCalc([Coeff | Rest], VarValue, Result) :-
    polyCalc(Rest, VarValue, RestResult),
    Result is Coeff + VarValue * RestResult.
