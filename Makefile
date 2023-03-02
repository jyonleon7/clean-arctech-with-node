mysql:
	docker-compose exec mysql mysql -ureversi -ppassword

d-start:
	docker-compose up -d

d-down:
	docker-compose down

.PHONY: mysql