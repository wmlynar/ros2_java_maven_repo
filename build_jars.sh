#!/bin/sh

docker run --rm -v "$(pwd):/work" -w "/work" -t ros2_bionic bash -c "\
	rm -rf ~/.m2/repository/org/ros2/java/ &&\
	cp -r org/ros2/java/ ~/.m2/repository/org/ros2/java/ &&\
	cd ~/ros2_java_ws/src/ros2_java/ros2_java &&\
	git pull &&\
	cd ../ros2_java_examples/ &&\
	git pull &&\
        cd ../ros2_java_di &&\
        git pull &&\
        cd ../ros2_java_di_example &&\
        git pull &&\
        cd ../ros2_java_tf &&\
        git pull &&\
        cd ../ros2_java_launch &&\
        git pull &&\
	cd ../../.. &&\
	. ~/ament_ws/install_isolated/local_setup.sh &&\
	ament build --symlink-install --isolated --only-packages rcljava rcljava_common rcljava_examples &&\
        cd ~/ros2_java_ws/src/ros2_java/ros2_java &&\
	./install_jars.sh &&\
	./install_maven.sh &&\
	cd /work &&\
        rm -rf org/ros2/java/ &&\
        cp -r ~/.m2/repository/org/ros2/java/ org/ros2/java/ \
	"
