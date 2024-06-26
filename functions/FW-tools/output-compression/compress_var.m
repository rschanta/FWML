%{
compress_var
    - compresses all the time steps from a 1D simulation to an array for a
      given variable, where each row is a time step and each column is a 
      position in Mglob
    
    - NOTE: this currently assumes single precision Binary values, but
      this can be changed by changing `single`
%}
function out_array = compress_var(path,var,Mglob,Nglob,no_steps)
%% Arguments
%{
    - path: path to out_XXXXX directory
    - var: variable to search for as a string (`eta`, `u`, etc.)
    - Mglob: Mglob variable of FUNWAVE
    - Nglob: Nglob variable of FUNWAVE
%}

%% Get all files containing 'var' in the name
    try
        varsearch = ['*',var,'*'];
        output_files = {dir(fullfile(path, varsearch)).name};
        disp(['Searching for: ', var])
        %% Loop through all files
        out_array = zeros(length(output_files),Mglob);
        upper_bound = min(length(output_files),no_steps);
        for j = 1:length(output_files)
        %for j = 1:length(output_files)
            file = fullfile(path, output_files{j});
            fileID = fopen(file);
                    output = fread(fileID,[Mglob,Nglob],'single');
                    output = output';
                    fclose(fileID);
                %%% Pull out just a middle row (1D)
                    out_array(j,:) = output(2,:);
        end
    catch
        disp(['Issue finding: ', var])
    end
end
