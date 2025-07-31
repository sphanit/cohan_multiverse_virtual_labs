FROM multiverseframework/multiverse-tutorials:ubuntu-20.04@sha256:417be156a21aac849c2a6d43da695d6690d5a414677bef409b0b027b3aab7b1f

ENV SHELL=/bin/bash \
    NB_USER=jovyan \
    NB_UID=1000 \
    USER=jovyan \
    HOME=/home/jovyan

USER root

# Install the build tools
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update
RUN apt-get update && apt-get install -y \
    build-essential \
    clang-format \
    clangd-10 \ 
    jq \
    gcc-10 \
    g++-10 \
    libsdl-image1.2-dev \
    libopenblas-dev \
    python3-catkin-tools \
    python3-pip \
    python-is-python3

# Use update alternative to set gcc/g++ to latest version
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10


# Install the dependecies for CoHAN
RUN apt-get install ros-noetic-navigation -y \
    ros-noetic-pr2-tuckarm \
    ros-noetic-costmap-converter \
    ros-noetic-libg2o \
    ros-noetic-mbf-costmap-core \
    ros-noetic-mbf-msgs \
    libsqlite3-dev \
    libzmq3-dev \
    qtbase5-dev \
    libqt5core5a \
    libqt5gui5 \
    libqt5widgets5 \
    libsdl-image1.2-dev \
    libyaml-cpp-dev \
    libboost-all-dev \
    ros-noetic-pr2-description \
    ros-noetic-teleop-twist-keyboard \
    ros-noetic-pr2-simulator \
    ros-noetic-pr2-gazebo \
    ros-noetic-teb-local-planner \
    libsdl2-dev

RUN source /opt/conda/etc/profile.d/conda.sh && conda activate multiverse && pip install --upgrade pip && pip install cmake==3.31.1 && pip install scipy

# Git clone CoHAN repository and compile
RUN git clone https://github.com/LAAS-HRI/CoHAN2.0 /home/CoHAN2.0
RUN source /opt/conda/etc/profile.d/conda.sh && conda activate multiverse && source /opt/ros/noetic/setup.bash && cd /home/CoHAN2.0 && ./compile.sh

COPY laas /home/Multiverse-Tutorials/resources/laas

WORKDIR /home
COPY --chown=${NB_USER}:users entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


