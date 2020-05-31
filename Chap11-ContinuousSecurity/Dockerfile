From ubuntu:latest

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y vim
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y gnupg
RUN apt-get update && apt-get install -y nmap
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
RUN chmod 775 /usr/src/app
RUN /bin/bash /usr/src/app/msfinstall

COPY commands.txt .

EXPOSE 8080

CMD [ "/bin/bash", "/usr/src/app/msfinstall" ]
