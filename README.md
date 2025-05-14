# APN_Flow_Liu_Arxiv_2025
Data Repository for MD simulation study of associative polymer networks in extensional flow by Liu &amp; O'Connor.

This repository contains the scripts and data necessary for analyzing associative polymer networks (APNs) simulations and generating plots for the associated manuscript.

### Repository Structure

Analysis_Plots.ipynb: A Jupyter Notebook that provides a guided analysis workflow, including data processing and visualization.

data/: A directory containing the processed data files required for generating plots. Note: Raw simulation data files are not included due to space constraints.

### LAMMPS Version and Required Packages

This analysis is based on LAMMPS version lammps-29Sep2021. The following LAMMPS packages are required:

MOLECULE

MANYBODY

UEF

UEFEX

NETCDF

Additionally, we customize the MANYBODY package with modified pair_tersoff .cpp and .h files that allow binary coordination and bond swapping of stickers. These files are uploaded in this repository in `customized_teroff_lammps`. We utilize the version for dissociative-type hydrogen-bonding-like exchange kinetics with half barrier in `tersoff_lammps_file_with_half_barrier` to conduct our APNs simulations.

### Requirements

The scripts require the following Python packages:

numpy

matplotlib

jupyter

Install dependencies using:

pip install numpy matplotlib jupyter

### Usage Guide

Prepare Data: Ensure the processed data files are placed inside the data/ folder.

Run the Notebook: Open and execute Analysis_Plots.ipynb to generate the figures for the manuscript.

### Notes

The Jupyter notebook provides step-by-step guidance on the analysis process.

Modify paths in the notebook if necessary to match your directory structure.

**For any questions or issues, please contact the project maintainer.**
