FROM datasetteproject/datasette
RUN apt update && apt install -y wget bzip2
RUN wget -q https://latest.datasette.io/fixtures.db
RUN datasette inspect --inspect-file=inspect.json fixtures.db
EXPOSE 8001
CMD ["datasette", "-h", "0.0.0.0", "--inspect-file", "inspect.json", "-p", "8001", "-i" "fixtures.db", "--cors"]
