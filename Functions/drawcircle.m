function drawcircle(x_origin,y_origin,r)
    theta = 0:0.1:(2*pi + 1);
    x = x_origin + r*cos(theta);
    y = y_origin + r*sin(theta);
    plot(x,y);
end
