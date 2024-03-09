FROM trestletech/plumber

# copy necessary files
RUN mkdir /models
RUN mkdir /src
COPY models/car_price.rds /models/car_price.rds
COPY src/deploy_noYAML.R /src/plumber.R
WORKDIR /src

# plumber instructions to run
EXPOSE 8000
ENTRYPOINT ["R", "-e",  "pr <- plumber::plumb('/src/plumber.R'); \
    pr$run(host='0.0.0.0', port=8000)"]
