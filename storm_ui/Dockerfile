FROM docker.prolucid.ca/prolucid_storm_base 
MAINTAINER Daniel Covello 

# Configure ui startup script
RUN sed -i -e "s/%STORMAPP%/ui/g" /etc/service/storm/run
RUN chmod +x /etc/service/storm/run

EXPOSE 8080

