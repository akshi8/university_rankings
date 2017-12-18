# Docker file for university_Rankings
# Akshi Chaudhary, 16-12-2017

# use rocker:r-base as base image
FROM rocker/r-base

# get OS updates and install build tools
RUN apt-get update
RUN apt-get install -y build-essential

# install wget and git
RUN apt-get install -y wget
RUN apt-get install -y make git

# clone, build university_rankings
RUN git clone https://github.com/akshi8/University_rankings.git

RUN yes | apt-get install aptitude

RUN yes | apt-get install libcurl4-openssl-dev

RUN yes | apt-get install libxml2-dev

RUN yes | apt-get install libssl-dev/unstable

RUN yes | apt-get install pandoc

RUN export R_PROFILE=/university_rankings/.Rprofile

WORKDIR "/university_rankings"

RUN R -e 'install.packages("packrat")'
RUN R -e 'packrat::restore()'
RUN R -e 'packrat::on()'

# Set the default command
ENTRYPOINT ["bash"]
