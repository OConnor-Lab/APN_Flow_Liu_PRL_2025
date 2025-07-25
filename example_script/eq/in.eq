# LAMMPS input scipts for simulating APNs at equilibrium condition

# NOTE: These are not intended to represent real materials

units           lj
atom_style      molecular
boundary        p p p
dimension	3

# load input data file for APN system with 2000 chains and 80 beads per chain
read_data   ./data.M2000N80

#reset_timestep	0
velocity 	all zero linear
velocity 	all zero angular

# Sample temperature
variable t equal 1.0

variable	name string "eq_18kT"
log		log.${name}


#Define Physical Forces
bond_style      fene
special_bonds   fene
bond_coeff	* 30.0 1.5 1.0 1.0
angle_style	cosine
angle_coeff	* 1.5

pair_style      hybrid/overlay lj/cut 1.1225 tersoff
pair_coeff      * * tersoff bead2.tersoff NULL B1 # make B1 & B2 tersoff but not B1
pair_coeff 	    * * lj/cut 0.0 1.0 1.1225 # clear all fene potential
pair_coeff 	    1 * lj/cut 1.0 1.0 1.1225 # make type 1 to others in normal fene potential


thermo_style    custom step temp epair etotal econserve press
thermo          10000
variable	s equal step

fix		 1 all nve
fix		 2 all langevin $t $t 100 657445
fix		 3 all momentum 100 linear 1 1 1
fix 	 4 all recenter INIT INIT INIT units box

timestep        0.005
neighbor        0.3 bin
#neigh_modify    every 1 delay 0 check yes

# Green-Kubo for relaxation modulus
fix 		5 all ave/correlate/long 1 5000 c_thermo_press[4] c_thermo_press[5] c_thermo_press[6] file stress_auto_${name}.txt overwrite ncorr 30 nlen 16 ncount 2


restart		100000 cpA.restart cpB.restart
dump		1 all netcdf 100000 dump.nc id type mol x y z ix iy iz
dump_modify	1 append yes at -2
run             1000000000

write_restart restart.${name}
write_data    data.${name}
