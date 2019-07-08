FROM datasetteproject/datasette
RUN apt update && apt install -y wget bzip2
RUN wget -q https://latest.datasette.io/fixtures.db
# RUN datasette inspect --inspect-file=/mnt/whosonfirst/inspect.json /fixtures.db /mnt/whosonfirst/whosonfirst-data-latest.db
EXPOSE 8001
CMD ["datasette", "-h", "0.0.0.0", "-p", "8001", "/mnt/whosonfirst/whosonfirst-data-latest.db", "/fixtures.db", "--cors"]
