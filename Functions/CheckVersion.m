LinSim = "Linearisation_Sim";
PIDSim = "PID_Sim";
StateSpaceSim = "StateSpace_Sim";

v = version('-release');
v_num = str2num(extractBefore(v,5));

if v_num < 2018
    LinSim = "Linearisation_Sim_2012a"
    PIDSim = "PID_Sim_2012a";
    StateSpaceSim = "StateSpace_Sim_2012a";
    warning("You are running an old version of Matlab. The SIMULINK Models were not made with your end use in mind.");
end