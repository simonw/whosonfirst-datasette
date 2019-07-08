FROM datasetteproject/datasette
RUN apt update && apt install -y wget bzip2
RUN wget -q https://latest.datasette.io/fixtures.db
# RUN datasette inspect --inspect-file=/mnt/whosonfirst/inspect.json /fixtures.db /mnt/whosonfirst/whosonfirst-data-latest.db
EXPOSE 8001
CMD ["datasette", "-h", "0.0.0.0", "--inspect-file", "/mnt/whosonfirst/inspect.json", "-p", "8001", "-i", "/mnt/whosonfirst/whosonfirst-data-latest.db", "-i", "/fixtures.db", "--cors"]
