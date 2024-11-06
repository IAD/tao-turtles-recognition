train:
	yolo train data=datasets/data.yaml model=yolo11n.pt epochs=10 lr0=0.01 pretrained=False

predict:
	yolo predict model=yolo11n.pt source='photos/Yak-4.jpg'

run:
	 cd app && uvicorn main:app --reload --host 0.0.0.0 --port 8001

docker-build:
	docker build -t python-app .

docker-run:
	docker run -p 8001:8001 docker.io/library/python-app
