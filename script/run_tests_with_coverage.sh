
echo "---- Parsing coverage file ----"
line=$(grep 'GLOBAL' -A1 $COVERAGE_FILE | grep -v 'GLOBAL')
coverage=$(echo "$line" | cut -d'%' -f 1)
if (( $(echo "$coverage <= 50" | bc -l) )) ; then
  color=red
elif (( $(echo "$coverage > 80" | bc -l) )); then
  color=green
else
  color=orange
fi

echo "---- Creating badge ----"
curl "https://img.shields.io/badge/coverage-$coverage%25-$color" > coverage_badge.svg

echo "---- Authenticating google cloud ----"
gcloud auth activate-service-account -q --key-file service_account.json

echo "---- Uploading badge to Google Cloud Storage ----"
gsutil -h "Cache-Control: no-cache" cp coverage_badge.svg gs://$BUCKET_NAME/coverage_badge.svg
gsutil acl ch -u AllUsers:R gs://$BUCKET_NAME/coverage_badge.svg

echo "---- Uploading coverage result to Google Cloud Storage ----"
gsutil cp $COVERAGE_FILE gs://$BUCKET_NAME/$COVERAGE_FILE