clear;clc;close all;
%====================================================%
%       Simply run this code, it's interactive!      %
%                                                    %
%                            -Nareshkumar Rao, 2019  %
%====================================================%
%
%P.S. You may modify the file 'InitialValues.m'.

%Set to true, to display information in the command window.
verbose = false;

if ~exist("./Functions/",'dir'), error("Not in main directory!"), end;
addpath("./Functions/","./Simulink_Models/","./SaveData/");

%Import the necessary initial values into the workspace
run("InitialValues");

%Makes sure that Simulink puts all its temporary/cache files into a
%separate folder to not pollute the working folder.
Simulink.fileGenControl('set', ...
   'CacheFolder',"./temp/", ...
   'CodeGenFolder',"./temp", ...
   'createDir',true);

%Select Control Type
list = {'PID Control','State-Space Control'};
[indx,tf] = listdlg('ListString',list,'SelectionMode','single','PromptString','Select Control Style','ListSize',[160 50]);

if isempty(indx)
    error("No Control Type Selected!");
end

%Run the simulation!
if indx==2
    prompt = {"File Name (if unsure press 'Cancel'):"};
    toLoadSave = inputdlg(prompt,'Load Saved Linearisation?',[1 50],"LinSys");
    
    %Runs the Linearisation of the Pendulum System.
    f = waitbar(.25,"Linearising System...");
    run("Linearise");
    waitbar(.75,f);
    sim("StateSpace_Sim");
    close(f);
elseif indx==1
    f = waitbar(.25,"Running Simulation...");
    sim("PID_Sim");
    close(f);
end

%Should save GIF?
saveGIF = false;
answer = questdlg("Save GIF Animation?","SimPendel","Yes","No","No");
if answer == "Yes", saveGIF = true; end

%Animate the results!
run("Animate");

f = waitbar(.25,"Cleaning Workspace...");
%Cleans up the workspace from all the loaded variables.
run("CleanWS");
close(f);clear f;

msgbox(sprintf("Completed!\n\nhttps://github.com/naresh97/SimPendel/"));