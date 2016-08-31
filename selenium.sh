#!/usr/bin/env bash

# Stops Selenium Server is already running
# http://stackoverflow.com/questions/5883450/selenium-invalid-already-running-error-when-starting-server
#kill -9 $(lsof -ti tcp:4444)
#echo "Selenium Server stopped."


# Start Selenium Server
DISPLAY=:1 xvfb-run --auto-servernum java -jar ./selenium-server-standalone-3.0.0-beta1.jar
echo "Selenium Server started."