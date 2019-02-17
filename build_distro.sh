#!/bin/sh
rm ros2_java_libs.zip
rm ros2-java-libs-$2-0.0.1-SNAPSHOT.zip

docker run --rm -v "$(pwd):/work" -w "/work" -t $1 bash -c "\
	cd /root/ros2_java_ws/src/ros2_java/ros2_java &&\
	git pull &&\
        cd /work &&\
	apt-get -y install zip &&\
        /root/ros2_java_ws/src/ros2_java/ros2_java/scripts/build_docker/build_ros2_java_libs_zip_file.sh \
	"

mv ros2_java_libs.zip ros2-java-libs-$2-0.0.1-SNAPSHOT.zip

