function YP = dpendel_ode(t,dv,da,Y)
    g = 9.81;
    L = 10;
    m=2;
    lambda=1;

    YP = zeros(1,2);

    YP(1) = Y(2);
    YP(2) = (-L * lambda * Y(2) - dv * cos(Y(1)) * lambda - da * cos(Y(1)) * m - sin(Y(1)) * g * m) / L / m;

end