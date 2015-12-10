FROM docker.prolucid.ca/prolucid_storm_base
MAINTAINER Daniel Covello 

# Configure supervisor startup script
RUN sed -i -e "s/%STORMAPP%/supervisor/g" /etc/service/storm/run
RUN chmod +x /etc/service/storm/run

EXPOSE 6700 6701 6702 6703 8000

