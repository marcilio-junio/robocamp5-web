pipeline {
    agent {
        docker{
            image 'qaninja/python-wd'
            args '--network=skynet'
        }
    }

    stages {
        stage('Build'){
            steps{
                sh 'pip install -r requirements.txt'
                sh ''
            }
        }
        stage('Testing'){
            steps{
                sh 'robot -d ./logs -i sucess_login -v browser:headless tests/'
            }
            post{
                always{
                    robot outputPath: 'logs', otherFiles: '**/*.png'
                }
            }
        }
        stage('Acceptance Tests'){
            steps {
                echo 'Simulando a aprovação do PO'
                input(message: 'Você aprova essa versão?', ok: 'Sim :)')
            }
        }
    }
}