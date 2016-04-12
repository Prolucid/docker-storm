FROM prolucid/storm_base 
MAINTAINER Daniel Covello 

# The versions (github branches) that should be pulled and compiled
ENV MONO_VERSION=mono-4.2.1.102

# Install F# + Mono
ENV SETUP_TOOLS="make pkg-config git autoconf libtool automake build-essential gettext "
WORKDIR /deploy

RUN apt-get update \
        && apt-get install -y vim curl unzip s3cmd $SETUP_TOOLS \
        && apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
        && git clone git://github.com/mono/llvm.git \
        && cd /deploy/llvm \
        && ./configure --enable-optimized --enable-targets="x86 x86_64" \
        && make \
        && make install \
        && cd /deploy \
        && git clone git://github.com/mono/mono --branch $MONO_VERSION  \
        && cd /deploy/mono \
        && bash ./autogen.sh --enable-llvm=yes \
        && make get-monolite-latest \
        && make \
        && make install \
        && mozroots --import --sync \
        && git clone https://github.com/fsharp/fsharp \
        && cd fsharp \
        && ./autogen.sh --prefix /usr/local \
        && make \
        && sudo make install \
        && apt-get remove -y --purge $SETUP_TOOLS \
        && apt-get autoremove -y \
        && rm -rf /deploy

# Configure supervisor startup script
RUN sed -i -e "s/%STORMAPP%/supervisor/g" /etc/service/storm/run
RUN chmod +x /etc/service/storm/run

EXPOSE 6700 6701 6702 6703 8000

