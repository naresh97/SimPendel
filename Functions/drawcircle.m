function ball = drawcircle(ax, x_origin,y_origin,r,varargin)
    
    theta = 0:0.1:(2*pi + 1);
    x = x_origin + r*cos(theta);
    y = y_origin + r*sin(theta);
    if(length(varargin) == 1)
        ball = [x;y];
        return;
    end
    ball = plot(ax, x,y);
end
