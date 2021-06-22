FROM litecoin:0.18.1
RUN echo 'sha256:...of the image' | sha1sum -c - #verifying checksum
RUN useradd -u 1000 user #adding normal user
USER user
RUN systemctl start daemon_name > daemon.txt #run the daemon
CMD ['echo', 'daemon.txt']


#After building this Dockerfile as litecoin:latest image
#now testing container images security using Anchore
#Assuming that Anchore Engine and Anchore CLI are installed
To analyse the image with: anchore-cli image add litecoin:latest