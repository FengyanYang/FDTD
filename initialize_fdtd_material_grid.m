%initialize_fdtd_material_grid. m 
disp ('initializing-FDTD material grid'); 
%calculate problem space size based on the object
%locations and boundary conditions
%calculate domain size;

%Array to store material type indices for every cell
%in the problem space. By default the space is filled

materia1_3d_space = ones(nx,ny,nz); %ones函数用法同zeros相同，只不过生成的是全1阵

%create the 3D objects in the problem space by
%assigning indices of material types in the cells
%to material 3d space 

%create spheres
create_spheres;
%create bricks;
create_bricks;

%Material component arrays for a problem space
%composed of {nx, ny, nz)cells
eps_r_x=ones(nx,nypl,nzpl);
eps_r_y=ones (nxpl,ny,nzpl);
eps_r_z=ones(nxpl, nypl, nz);
mu_r_x =ones (nxpl,ny,nz);
mu_r_y =ones(nx,nypl,nz);
mu_r_z=ones(nx,ny,nzpl);
sigma_e_x=zeros (nx, nypl, nzpl);
sigma_e_y=zeros (nxpl,ny,nzpl);
sigma_e_z=zeros (nxpl, nypl, nz);
sigma_m_x=zeros (nxpl,ny,nz);
sigma_m_y=zeros (nx,nypl,nz); 
sigma_m_z=zeros (nx,ny,nzpl);

% calculate material component values by averaging 
calculate_material_component_values; 
% create zero thickness PEC plates 
create_PEC_ylates; 




























