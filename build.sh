docker build -t echohealth/android-build .

GIT_COMMIT=$(git rev-parse HEAD)

docker tag echohealth/android-build echohealth/android-build:latest
docker tag echohealth/android-build echohealth/android-build:$GIT_COMMIT

docker push echohealth/android-build:latest
docker push echohealth/android-build:$GIT_COMMIT