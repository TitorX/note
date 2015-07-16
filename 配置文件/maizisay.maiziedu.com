
upstream maizisay {
    server 127.0.0.1:8005;
}

server {
    # the port your site will be served on
    listen      80;
    # the domain name it will serve for
    server_name 192.168.1.52; # substitute your machine's IP address or FQDN
    charset     utf-8;

    # max upload size
    client_max_body_size 75M;   # adjust to taste


    location /static {
        alias /home/maiziedu/Code/trunk/static; # your Django project's static files - amend as required
    }

    location /uploads {
        alias /home/maiziedu/Code/trunk/uploads;
    }

    location /pages {
        alias /home/maiziedu/Code/trunk/pages;
    }

    # Finally, send all non-media requests to the Django server.
    location / {
	include uwsgi_params;
        uwsgi_pass  maizisay;
    }
}
