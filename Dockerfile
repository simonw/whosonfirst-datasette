FROM datasetteproject/datasette
RUN apt update && apt install -y wget bzip2
RUN wget -q https://dist.whosonfirst.org/sqlite/whosonfirst-data-latest.db.bz2
RUN bunzip2 whosonfirst-data-latest.db.bz2
RUN datasette inspect --inspect-file=inspect.json whosonfirst-data-latest.db.bz2
EXPOSE 8001
CMD ["datasette", "-h", "0.0.0.0", "--inspect-file", "inspect.json", "-p", "8001", "whosonfirst-data-latest.db", "--cors"]
