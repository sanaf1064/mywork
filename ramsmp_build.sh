build_ramsmp() {
   set -e

   CoreMarkPath=$BENCH_PATH"502.ramsmp"
   myOBJPATH=${INSTALL_DIR}/bin
   pushd $CoreMarkPath
   if [ $ARCH = "x86_64" -o $ARCH = "x86_32" ]; then
# -O2 -msse4
	/bin/sh build.sh
   fi
   if [ $ARCH = "arm_32" ]; then
      # O2 -mfloat-abi=hard -mfpu=vfpv4 -mcpu=cortex-a15
	/bin/sh build.sh
   fi
   if [ $ARCH = "arm_64"  ]; then
	/bin/sh build.sh Linux aarch64
   fi
   cp ramsmp $myOBJPATH/ramsmp
   cp ramscript.sh $myOBJPATH/ramscript.sh

   #if [ $ARCH = "android" ]; then
        #ndk-build
        #cp  libs/armeabi-v7a/coremark $myOBJPATH/
        #ndk-build clean
        #rm -rf libs/ obj/
   #fi
   popd

}
build_ramsmp
