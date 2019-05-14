clear Qk Rm K P L M x_lin_i A B C D io linsys
clear mdl toLoadSave a d fr i lims logsout R tout list indx tf
clear file path prompt alen L_cos_a pre_d pre_d_n d_p_L_sin_a

warning('off','MATLAB:RMDIR:RemovedFromPath');
warning('off','MATLAB:DELETE:FileNotFound');
rmdir("./temp/","s");
delete("Main.asv");