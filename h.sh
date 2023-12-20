counter=0
sleeptime=2
limit=2
while [ ! -f sc.lock ]
do
  echo "No lock..."
  sleep $sleeptime
  echo "Does lock exist?"
  counter=$((counter + 1))
  if [ $counter -ge $limit ]; then
    echo "Lock file was not created after $counter tries; spent $((counter*sleeptime)) seconds trying and retrying. That's a fail bruh. Yer done. ¯\_(ツ)_/¯"
    exit 1
  fi
done