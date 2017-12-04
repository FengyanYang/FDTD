%calculate_domain_size. m
disp ('calculating the number of cells in the problem space'); 
number_of_spheres =size(spheres, 2); 
number_of_bricks = size(bricks, 2); 
% find the minimum and maximum coordinates of a 
% box encapsulating the objects 
number_of_objects = l; 

for i=1:number_of_spheres
   min_x(number_of_objects)=spheres(i).center_x - spheres(i).radius;
   min_y(number_of_objects)=spheres(i).center_y - spheres(i).radius;
   min_z(number_of_objects)=spheres(i).center_z - spheres(i).radius;
   max_x(number_of_objects)=spheres(i).center_x+ spheres(i). radius;
   max_y(number_of_objects)=spheres(i).center_y+ spheres(i). radius;
   max_z(number_of_objects)=spheres(i).center_z+ spheres(i). radius;
   number_of_objects = number_of_objects+ 1;
end

for i=1:number_of_bricks
    min_x(number_of_objects)=bricks (i). min_x;
    min_y(number_of_objects)=bricks (i). min_y;
    min_z(number_of_objects)=bricks (i). min_z;
    max_x(number_of_objects)=bricks (i). max_x;
    max_y(number_of_objects)=bricks (i). max_y; 
    max_z(number_of_objects)=bricks (i). max_z;
    number_of_objects= number_of_objects+ 1;
end

fdtd_domain. min_x =min(min_x);
fdtd_domain. min_y =min(min_y);
fdtd_domain. min_y =min(min_z);
fdtd_domain. max_x=max(max_x);
fdtd_domain. max_x=max(max_y);
fdtd_domain. max_x=max(max_z);

%Determine the problem space boundaries including air buffers
fdtd_domain.min_x=fdtd_domain.min_x...
    - dx * boundary. air_buffer_number_of_cells_xn;
fdtd_domain.min_y=fdtd_domain.min_y...
    - dx * boundary. air_buffer_number_of_cells_yn;
fdtd_domain.min_z=fdtd_domain.min_z...
    - dx * boundary. air_buffer_number_of_cells_zn;
fdtd_domain.max_x=fdtd_domain. max_x ...
    + dx * boundary. air_buffer_number_of_cells_xp;
fdtd_domain.max_y=fdtd_domain. max_y ...
    + dx * boundary. air_buffer_number_of_cells_yp;
fdtd_domain.max_z=fdtd_domain. max_z ...
    + dx * boundary. air_buffer_number_of_cells_zp;

% Determining the problem space size 
fdtd_domain.size_x=fdtd_domain.max_x - fdtd_domain.min_x; 
fdtd_domain.size_y= fdtd_domain.max_y - fdtd_domain.min_y;
fdtd_domain.size_z= fdtd_domain.max_z - fdtd_domain.min_z;

% number of cells in x, y, and z directions
nx = round(fdtd_domain.size_x/dx);
ny = round (fdtd_domain.size_y/dy);
nz = round (fdtd_domain.size_z/dz);

%adjust domain size by snapping to cells 
fdtd_domain.size_x=nx * dx;  
fdtd_domain.size_y= ny * dy; 
fdtd_domain.size_z =nz * dz; 

fdtd_domain.max_x= fdtd_domain.min_x+ fdtd_domain.size_x;
fdtd_domain.max_y= fdtd_domain.min_y+ fdtd_domain.size_y;
fdtd_domain.max_z= fdtd_domain. min_z+fdtd_domain.size_z;

%some frequently used auxiliary parameters
nxpl = nx+ l; nypl = ny+ 1; nzpl= nz+ 1; 
nxml = nx- 1; nxm2= nx- 2; nyml= ny- 1;
nym2 = ny- 2; nzml =nz- 1;nzm2 = nz- 2;

% create arrays storing the center coordinates of the cells
fdtd_domain.cell_center_coordinates_x= zeros(nx,ny,nz); 
fdtd_domain. cell_center_coordinates_y = zeros(nx,ny,nz); 
fdtd_domain. cell_center_coordinates_z= zeros (nx,ny,nz); 
for ind = 1 :nx 
fdtd_domain.cell_center_coordinates_x(ind, :,:)=...
 (ind -0.5) * dx+ fdtd_domain. min_x; 
end 
for ind = 1 :ny
fdtd_domain.cell_center_coordinates_y(ind, :,:)=...
 (ind -0.5) * dy+ fdtd_domain. min_y; 
end 
 for ind = 1 :nz 
fdtd_domain.cell_center_coordinates_z(ind, :,:)=...
 (ind -0.5) * dz+ fdtd_domain. min_z; 
end 
  
