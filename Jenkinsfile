pipeline {
    environment {
        GIT_PROJECT_ADDR="https://github.com/ArvZhou/middleware-express.git" //项目的git地址
        IMAGE_NAME="middlemare-express"                    // 镜像名
        IMAGE_ADDR="ccr.ccs.tencentyun.com/qiao_namespace/${IMAGE_NAME}"    // 镜像的位置
        VERSION_ID="123456"
    }

    stages {
        stage('pullCode'){
            steps{
                echo 'This is a pullCode step'
                checkout scm
            }
        }
        stage('generate docker image') {
            steps{
                echo 'push jar to target server'
                sh '''
                    ole_image_id=`docker images|grep ${IMAGE_NAME}|grep ${VERSION_ID}|awk '{print $3}'`
                    if [[ -n "${ole_image_id}" ]]; then
                        docker rmi -f ${ole_image_id}
                    fi
                    
                    docker build -f Dockerfile -t ${IMAGE_NAME}:${VERSION_ID} .
                '''
            }
        }
    }
}