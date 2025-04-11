function J = Jacob(x)
global t
J1 = x(2)*t/(x(1)*t-1);
J2 = log(1-x(1)*t);
J = [J1,J2];
end