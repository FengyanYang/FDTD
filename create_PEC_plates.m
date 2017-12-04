%create_PEC_plates. m
disp ('creating PEC plates on the material grid');
for ind= 1:number_of_bricks
    mtype = bricks (ind). material_type; 
    sigma_pec = material_types (mtype). sigma_e; 
  % convert coordinates to node indices on the FDTD grid 
blx= round ((bricks (ind). min_x - fdtd_domain. min_x) /dx) + 1; 
bly = round ((bricks (ind). min_y - fdtd_domain. min_y) /dy)+ 1; 
blz = round ((bricks (ind). min_z - fdtd_domain. min_z) /dz)+ l;

bux = round ((bricks (ind). max_x - fdtd_domain. min_x) /dx) + 1; 
buy= round ((bricks (ind). max_y - fdtd_domain. min_y) /dy) + 1; 
buz = round ((bricks (ind). max_z - fdtd_domain. min_z) /dz)+ 1; 
% find the zero thickness bricks 
if (blx = = bux) 
    sigma_e_y(blx,bly:buy-l,blz:buz)=sigma_pec;
    sigma_e_x(blx:bux- 1,bly,blz:buz)=sigma_pec;
end

if (blz = = buz)
    sigma_e_x(blx:bux- l,bly:buy,blz)= sigma_pec;
    sigma_e_y(blx:bux,bly:buy- l,blz) =sigma_pec;
end
    
end 