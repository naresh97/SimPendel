if ~isempty(toLoadSave)
    if ~isempty(toLoadSave{1})
        %If system already linearised and saved, simply load the data.
        load(toLoadSave{1});
        waitbar(.5,f);
    end
else
    %Else, linearise the system from the Simulink Model again.
    mdl = LinSim;
    load_system(mdl);
    io = getlinio(mdl);
    linsys = linearize(mdl,io);
    close_system(mdl);
    waitbar(.5,f);
    
    [file,path,indx] = uiputfile('LinSys.mat');
    if file~=0
        save(string(path)+file, "linsys");
    end
end

A = linsys.A;
B = linsys.B;
C = linsys.C;
D = linsys.D;

%Initial Variables for Linearized System
x_lin_i = [evalin('base', 'x_initial'); 0;];

%Matrix-Ricatti Controller
Qk = [
    1e1 0 0
    0 1e1 0
    0 0 1e1;];
Rm = 1e1;
K = lqr(A,B,Qk,Rm);
waitbar(.6,f);

%Obversor-Matrixes (Luneberger Observer)
P = real(eig(A-B*K)) - 10 + imag(eig(A-B*K));
L = place(A', C', P)';
waitbar(.7,f);

%Prefilter Matrix
M = (C*((B*K-A)^(-1))*B)^(-1);