# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/usr/bin/python3:/bin/python3
export DOCKER_HOST=tcp://localhost:2375/usr/local/bin/docker-compose
export PATH

export PYTHON=$HOME/usr/bin/python3

PATH=$PATH:$HOME/bin
export POSTGRESS_USERNAME=postgres;
export POSTGRESS_PASSWORD=udagrampostgres;
export POSTGRESS_DB=postgres;
export POSTGRESS_HOST=udagrampostgres.cvqgygxhhehg.us-east-1.rds.amazonaws.com;
export AWS_REGION=us-east-1;
export AWS_PROFILE=default;
export AWS_BUCKET=udagramgoswamibucket;
export JWT_SECRET=helloworld;
export  DOCKER_HOST=/usr/local/bin/docker-compose;




export PATH
