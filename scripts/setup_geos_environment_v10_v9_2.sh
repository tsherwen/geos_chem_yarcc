################################################################################
# ENVIRONMENT MODULES
#-------------------------------------------------------------------------------
# These modules MUST be loaded in the below order before compiling and running
# GEOS-Chem.
################################################################################
module load icc/2013_sp1.3.174
module load ifort/2013_sp1.3.174
module load hdf5/1.8.18
module load NetCDF-complete/4.4.1.1_4.4.4

################################################################################
# COMPILER VARIABLES
#-------------------------------------------------------------------------------
# The modules:
#     - icc/2013_sp1.3.174
#     - ifort/2013_sp1.3.174
# must be loaded in the above order before setting these variables.
################################################################################
export CC=icc
export FC=ifort
export CXX=icpc
export COMPILER=$FC

################################################################################
# NETCDF LIBRARY VARIABLES
#-------------------------------------------------------------------------------
# The modules:
#     - icc/2013_sp1.3.174
#     - ifort/2013_sp1.3.174
#     - hdf5/1.8.18
#     - NetCDF-complete/4.4.1.1_4.4.4
# must be loaded in the above order before setting these variables.
################################################################################
export GC_BASE="/opt/yarcc/libraries/NetCDF-complete/4.4.1.1_4.4.4/1/icc-2013_sp1.3.174-ifort-2013_sp1.3.174-hdf5-1.8.18"
export GC_BIN="$GC_BASE/bin"
export GC_INCLUDE="$GC_BASE/include"
export GC_LIB="$GC_BASE/lib"

################################################################################
# OPENMP VARIABLES
#-------------------------------------------------------------------------------
# These must be set before running GEOS-Chem.
################################################################################
export OMP_STACKSIZE=500m
