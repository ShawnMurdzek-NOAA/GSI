
source env/build_orion_intel.env
source env/srw_common

# Make a clean build
if [ -d ./build/ ]; then
  rm -r ./build
fi

if [ -d ./bin/ ]; then
  rm -r ./bin
fi

mkdir build
cd build

export CORE_DIR=/work2/noaa/wrfruc/murdzek/UAS_GSI_tests/GSI

cmake -DCMAKE_INSTALL_PREFIX=../bin/ ${CORE_DIR}
make -j8

# Copy files back to the run directory
cd ..
run_dir='/work2/noaa/wrfruc/murdzek/RRFS_OSSE/syn_data/spring_uas_35km/'
cp ./fix/errtable.rrfs ${run_dir}/ufs-srweather-app/regional_workflow/fix/gsi/
cp ./fix/convinfo.rrfs ${run_dir}/ufs-srweather-app/regional_workflow/fix/gsi/
cp ./build/src/gsi/gsi.x ${run_dir}/ufs-srweather-app/bin/
