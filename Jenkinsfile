#!/usr/bin/env groovy

pipeline {
    agent none

    stages {
        stage('Break Jenkins') {
            agent any
            steps {    
                sh '''#!/bin/bash
                  ENV_VAR=$(awk -F'-' '{print $2 }' <<< $(ls *))
                  echo $ENV_VAR
                '''
            }
        }
    }
}
