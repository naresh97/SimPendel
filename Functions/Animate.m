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
for i = 1:s:alen
    clf;
    clc;
    i + pretxt
    line([pre_d_n(i) pre_d(i)],[0 0], 'Color', 'k');
    xlim(lims(1,:));
    ylim(lims(2,:));
    hold on;
    
    line([d(i) d_p_L_sin_a(i)],[0 -L_cos_a(i)]);
    drawcircle(d_p_L_sin_a(i), -L_cos_a(i), R);

    hold off;
    drawnow;
end
