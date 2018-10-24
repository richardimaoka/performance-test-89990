# WRK performance test script

CURRENT_TIME=`date --iso-8601=seconds` #In the ISO 8601 format of '2018-10-21T15:59:45+09:00'

TARGET_ENDPOINT="http://localhost:8080"
DURATION=3

#POSSIBLE_CONNECTIONS=(10 50 100 200 400 800 1600)
POSSIBLE_CONNECTIONS=(50)
#POSSIBLE_THREADS=(1 2 3 4 5 6)
POSSIBLE_THREADS=(2 4)

OUTPUT_FILE="wrk_output.json"

trap "echo Exited!; exit;" SIGINT SIGTERM

for connections in "${POSSIBLE_CONNECTIONS[@]}"
do 
  for threads in "${POSSIBLE_THREADS[@]}"	
  do
    WRK_CMD="wrk -t${threads} -c${connections} -d${DURATION} -sjson.lua ${TARGET_ENDPOINT}"
    echo ${WRK_CMD}
    ${WRK_CMD}
    done
done

