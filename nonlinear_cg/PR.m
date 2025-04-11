function beta = PR(g0, gk)
beta = gk'*(gk - g0)/(g0'*g0);
end