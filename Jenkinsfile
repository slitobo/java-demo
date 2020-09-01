def APPNAME = "java-demo"
def REPOSITORY1 = "192.168.20.188:5001/slitobo/${APPNAME}:${BUILD_TIMESTAMP}"
node{
	stage('Git Checkout'){
          	git branch: '$BRANCH', url: 'https://github.com/slitobo/java-demo.git'
	}        
	stage('Maven Build') {
		sh '/usr/local/apache-maven-3.5.0/bin/mvn clean package -Dmaven.test.skip=true'
	}
	stage('Docker build') {
		R1 = ${REPOSITORY1}
		sh ''' 
		echo ${R1}
		REPOSITORY="192.168.20.188:5001/slitobo/java-demo:$ENV"
        	docker build -t ${REPOSITORY} .
        	docker push ${REPOSITORY}
		'''
    }
	stage('Deploy to Docker') {
       // 此处只是用一台机器模拟四套环境，正常启动一个环境就行
		sh '''
		REPOSITORY="192.168.20.188:5001/slitobo/java-demo:$ENV"
		ansible $ENV -a "docker rm -f java-demo-$ENV" | true
		ansible $ENV -a "docker  run -itd --name java-demo-$ENV -p 88:8080 ${REPOSITORY}"
        	'''
    }
}
