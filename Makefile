default:
	@echo 'Targets:'
	@echo '  deploy'

deploy:
	cp go_ssh ~/bin
	cp go_ssh_live.json ~/bin/go_ssh.json
