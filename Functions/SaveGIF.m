[file,path,indx] = uiputfile('Animation.gif');

f = waitbar(0,"Saving GIF...");
if file == 0, error("No filename given for GIF file!"); end

filename = string(path)+file;

first = true;
c = 0;
for i = M
    c = c+1;
    waitbar(c/length(M), f);
    im = frame2im(i); 
    [imind,cm] = rgb2ind(im,256); 
    if first
        imwrite(imind,cm,filename,'gif','Loopcount',inf,'DelayTime',0.05);
        first = false;
        continue;
    end
    imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.05); 
end
close(f);