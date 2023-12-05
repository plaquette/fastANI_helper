# # Use Python 3.8 slim as the base image
# FROM python:3.8-slim

# # Set the working directory
# WORKDIR /app

# # Install bash, pandas, click, biopython, pygenomeviz, and libgomp, then clean up
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends bash libgomp1 && \
#     pip install pandas click biopython pygenomeviz && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* && \
#     rm -rf /root/.cache

# # Copy the fastANI binary from the host to the container's /app directory
# COPY fastANI /app/fastANI

# # Make the fastANI binary executable
# RUN chmod +x /app/fastANI

# # Add /app to the PATH so that you can call ./fastANI from any directory
# ENV PATH="/app:${PATH}"

# # Command to run on container start
# CMD [ "bash" ]

# Use Python 3.8 slim as the base image
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Install bash, pandas, click, biopython, pygenomeviz, and libgomp, then clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends bash libgomp1 && \
    pip install pandas click biopython pygenomeviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache

# Copy the fastANI binary from the host to the container's /app directory
COPY fastANI /app/fastANI

# Make the fastANI binary executable
RUN chmod +x /app/fastANI

# Copy the visualize_two_genoms.py script from the host to the container's /app directory
COPY visualize_two_genoms.py /app/visualize_two_genoms.py

# Create a bash script to alias visualize_two_genoms.py
RUN echo '#!/bin/bash' > /app/visualize_two_genoms && \
    echo 'python3 /app/visualize_two_genoms.py "$@"' >> /app/visualize_two_genoms && \
    chmod +x /app/visualize_two_genoms

# Add /app to the PATH so that you can call ./fastANI, visualize_two_genoms, and other scripts from any directory
ENV PATH="/app:${PATH}"

# Command to run on container start
CMD [ "bash" ]

