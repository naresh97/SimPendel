R = 1;
L = 10;

a = a.Data;
d = d.Data;
close all;
fr = 2;
lims = [[-fr*L fr*L]; [-fr*L fr*L]];
alen = length(a);

s = 1;

if alen>200
    s = round(alen/200);
end

%Precalculating Vectors for Loop Efficiency
pre_d = R+d;
pre_d_n = (-R)+d;
d_p_L_sin_a = d+L.*sin(a);
L_cos_a = L.*cos(a);
pretxt = "/"+ alen +" frames @ "+s+"fps";

%figure;
ax = gca;
ax.XLim = lims(1,:);
ax.YLim = lims(2,:);

hold on;
i=1;
wagon = line(ax, [pre_d_n(i) pre_d(i)],[0 0], 'Color', 'k');
rope = line(ax, [d(i) d_p_L_sin_a(i)],[0 -L_cos_a(i)]);
ball = drawcircle(ax, d_p_L_sin_a(i), -L_cos_a(i), R);
hold off;

for i = 1:s:alen
    clc;
    if(verbose), i + pretxt, end
    
    wagon.XData = [pre_d_n(i) pre_d(i)];
    
    rope.XData =  [d(i) d_p_L_sin_a(i)];
    rope.YData = [0 -L_cos_a(i)];
    
    b = drawcircle(ax, d_p_L_sin_a(i), -L_cos_a(i), R, true);
    ball.XData = b(1,:);
    ball.YData = b(2,:);
    
    drawnow;
end
