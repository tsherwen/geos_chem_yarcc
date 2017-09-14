# GEOS-Chem Classic on YARCC
This repository contains a boilerplate job script and environment setup script for submitting GEOS-Chem Classic runs to YARCC, the York Advanced Research Computing Cluster. The scripts can be found in the `scripts` directory of this repository, and can be downloaded individually by (among other methods), clicking on the file name above, right clicking the 'Raw' button in the top-right of the file view, and selecting 'Save Link As' (or equivalent).

## Accessing YARCC
If you are a current University of York research student, you are eligible for YARCC access. Please send an email to <itsupport@york.ac.uk> in order to request access to YARCC. Once you've been granted access, you can follow the [instructions found in the York Research and High Performance Computing wiki space](https://wiki.york.ac.uk/display/RHPC/Accessing+YARCC) in order to start using YARCC.

Before using YARCC, you should read through the [YARCC documentation in the York Research and High Performance Computing wiki space](https://wiki.york.ac.uk/display/RHPC/YARCC+-+York+Advanced+Research+Computing+Cluster). This will provide you with useful information that is likely to increase your productivity on YARCC.

## Compiling GEOS-Chem on YARCC
There are a few simple steps to go through in order to compile GEOS-Chem Classic with Intel 2013 compilers on YARCC:

* copy/create a GEOS-Chem Classic source code directory into/in your YARCC scratch directory, resulting in e.g. `/scratch/USERNAME/Code.v11-01`

* set up the environment for compiling GEOS-Chem Classic. This can be achieved using the `setup_geos_environment_??.sh` file contained within this repository (where ?? = v10_v9_2 or v11, depending on version GEOS-Chem version you are using <= v10-01 or >=v11-01). Place the `setup_geos_environment.sh` file within your GEOS-Chem Classic source code directory, e.g.

```bash
wget https://raw.githubusercontent.com/wacl-york/geos_chem_yarcc/master/scripts/setup_geos_environment_v11.sh setup_geos_environment.sh
```

Source the environment:

```bash
source setup_geos_environment.sh
```

This loads requisite environment modules (like those for the Intel compilers and NetCDF) into your environment in the correct order, and sets some environment variables that will indicate to the compiler where the NetCDF libraries are located.

* compile GEOS-Chem as you normally would, e.g.

```bash
make -j4 mpbuild
```

You do not need to submit compilation tasks to the workload manager; you can compile GEOS-Chem Classic on the login nodes.

## Running GEOS-Chem on YARCC
Again, there are a few simple steps that you need to follow in order to submit GEOS-Chem Classic runs to the YARCC workload manager:

* copy/create your GEOS-Chem Classic run directory into/in your YARCC scratch directory, resulting in e.g.

```
/scratch/USERNAME/GEOS-Chem_Classic_v11-01_rundirs/geosfp_4x5_standard
```

* place the `setup_geos_environment.sh` file, found in the `scripts` directory of this repository, in the GEOS-Chem Classic run directory, e.g.

```bash
wget https://raw.githubusercontent.com/wacl-york/geos_chem_yarcc/master/scripts/setup_geos_environment.sh
```

* place the `geos_chem_classic.job` file, found in the `scripts` directory of this repository, in the GEOS-Chem Classic run directory, e.g.

```bash
wget https://raw.githubusercontent.com/wacl-york/geos_chem_yarcc/master/scripts/geos_chem_classic.job
```

* modify the `geos_chem_classic.job` file to suit the specifics of your run. There are detailed instructions on how to do this within the `geos_chem_classic.job` file
* modify the `input.geos` file in the following ways:
    * change the `Root data directory` field to `/shared/earthfs/work/data/GEOS/ExtData`
    * if you are using an input restart file that resides in the `ExtData` directory, replace everything in the `Input restart file` field up to and including `ExtData` with `/shared/earthfs/GEOS/ExtData`
    * change the `Dir w/ 1x1 emissions etc` field to `/shared/earthfs/work/data/GEOS/ExtData/GEOS_NATIVE`
* modify the `HEMCO_config.rc` file in the following ways:
    * change the `ROOT` field to `/shared/earthfs/work/data/GEOS/ExtData/HEMCO`

Once you have completed the above, and made any other run-specific customisations that you need to make, you can submit your job to the YARCC workload manager using `qsub` from within your run directory, e.g.

```bash
qsub geos_chem_classic.job
```

## Support & Troubleshooting
You can contact me at <killian.murphy@york.ac.uk> in the event of any issues with your jobs, or if you would like to go through the initial setup and first run submission on YARCC.
