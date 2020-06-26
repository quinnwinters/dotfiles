#!/bin/bash

if [[ ! $MYEMAIL =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4} ]] ; then
    echo "Environment variable for email is not set. Please enter your email address"
    while needemail=TRUE ; do
        read -r response
        if [[ $response =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4} ]] ; then
            export MYEMAIL='$response'
            echo "export MYEMAIL='$response'" >> ~/.bashrc
            break
        else
            echo "This email appears invalid. Please try again"
        fi
    done
fi