env.APPNAME = "java-demo"
env.REPOSITORY = "localhost/${APPNAME}:${BUILD_TIMESTAMP}"
node{
	stage('Git Checkout'){
		git branch: '$BRANCH', url: 'https://github.com/slitobo/java-demo.git'
	}        
	stage('Maven Build') {
		sh '/usr/local/apache-maven-3.5.0/bin/mvn clean package -Dmaven.test.skip=true'
	}
	stage('Docker build') {
		sh '''
        	docker build -t $REPOSITORY .
        	#docker push $REPOSITORY
		'''
    }
	stage('Deploy to Docker') {
       		// 此处只是用一台机器模拟四套环境
		sh '''
		ansible $ENV -a "docker rm -f $APPNAME-$ENV" | true
		ansible $ENV -a "docker  run -itd --name $APPNAME-$ENV -p 88:8080 $REPOSITORY"
        	'''
    }
}
