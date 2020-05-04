#!/bin/bash

jenvver=$(jenv --version 2>&1)
if [[ $? != 0 ]] ; then 
    brew install jenv
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

javaver=$(java --version 2>&1)
if [[ $? != 0 ]] ; then 
    brew install openjdk
fi 

scalaver=$(scala --version 2>&1)
if [[ $? != 0 ]] ; then 
    brew install scala
fi 

gradlever=$(gradle --version 2>&1)
if [[ $? != 0 ]] ; then 
    brew install gradle
fi 

sparkver=$(spark-shell --version 2>&1)
if [[ $? != 0 ]] ; then 
    brew install apache-spark
fi

ln -sf $(pwd)/jvmaliases ~/.aliases/jvmaliases

