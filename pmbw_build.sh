build_pmbw() {
   set -e


   CoreMarkPath=$BENCH_PATH"501.pmbw"
   myOBJPATH=${INSTALL_DIR}/bin
   pushd $CoreMarkPath
   if [ $ARCH = "x86_64" -o $ARCH = "x86_32" ]; then
# -O2 -msse4
        ./configure && make
   fi
   if [ $ARCH = "arm_32" ]; then
      # O2 -mfloat-abi=hard -mfpu=vfpv4 -mcpu=cortex-a15
        ./configure
   fi
   if [ $ARCH = "arm_64"  ]; then
       ./configure CXX=aarch64-linux-gnu-g++-4.8 --host=aarch64-linux-gnu
	make CC=aarch64-linux-gnu-gcc
   fi
   cp pmbw $myOBJPATH/pmbw
   cp runpmbw.sh $myOBJPATH/runpmbw.sh
   make  CC=$GCC clean
   #if [ $ARCH = "android" ]; then
        #ndk-build
        #cp  libs/armeabi-v7a/coremark $myOBJPATH/
        #ndk-build clean
        #rm -rf libs/ obj/
   #fi
   popd

}
build_pmbw

