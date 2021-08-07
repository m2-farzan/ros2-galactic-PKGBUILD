default:
	systemctl is-active --quiet docker.service || sudo systemctl start docker.service
	sudo bash -c "cd .. && docker build -f .test/Dockerfile --network="host" -t ros2-galactic-test ."

test:
	sudo docker run ros2-galactic-test && echo "Test good." || echo "Test failed."

clean:
	docker rmi ros2-galactic-test

share-cache:
	sudo ln -sf /var/lib/pacman/sync/*.db /var/cache/pacman/pkg
	sudo python -m http.server --directory /var/cache/pacman/pkg
