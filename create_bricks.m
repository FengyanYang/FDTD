disp ('creating bricks');
for ind= 1 :number_of_bricks
    % convert brick end coordinates to node indices
    blx = round ((bricks (ind). min_x -fdtd_domain. min_x) /dx) + 1;
    bly = round ((bricks (ind). min_y -fdtd_domain. min_y) /dy) + 1; 
    blz = round ((bricks (ind). min_z -fdtd_domain. min_z) /dz) + 1; 
    
    bux =round ((bricks (ind). max_x -fdtd_domain. min_x) /dx) + l;
    buy=round ((bricks (ind). max_y -fdtd_domain. min_y)/dy) + l;
    buz=round ((bricks (ind). max_z -fdtd_domain. min_z)/dz) + l;

    % assign material type of the brick to the cells 
    material_3d_space(blx:bux- l,bly:buy-l,blz:buz- 1) ...
        = bricks (ind). material_type; 
end 
