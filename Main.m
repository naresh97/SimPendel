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
    run("Linearise");
    sim("StateSpace_Sim");
elseif indx==1
    sim("PID_Sim");
end

%Animate the results!
run("Animate");

%Cleans up the workspace from all the loaded variables.
run("CleanWS");