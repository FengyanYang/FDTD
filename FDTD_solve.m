%initialize the matlab workspace
clear all; close all;clc;

%define the problem
define_problem_space_patameters;
define_geometry;
define_sources_and_lumped_elements;
define_output_parameters;

%initialize the problem space and parameters
initialize_fdtd_material_grid;
display_problem_space;
display_material_mesh;
if run_simulation
    initialize_fdtd_parameters_and_arrays;
    initialize_sources_and_lumped_elements;
    initialize_updating_coefficients;
    initialize_boundary_conditions;
    initialize_output_parameters;
    initialize_display_parameters;
    
    %FDTD time marching loop
    run_fdtd_time_marching_loop;
    
    %display simulation results
    post_process_and_display_results;
end