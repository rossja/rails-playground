# rails playground
a way to screw around with rails without borking your own system


# init

* run the init script:

~~~sh
cd init
./app-init.sh
~~~

* once the script has completed, copy the default rails app from the container to the source tree and then build the app container:

~~~sh
cd ..
docker cp $(docker ps -qaf ancestor=init_web --latest):/app/. src/
docker-compose build
~~~

# starting the app

From the root of the source tree:

* run `docker-compose up`

# stopping the app

run `docker-compose down`

# rebuilding

simple changes can be picked up with just a build, but if you change the
Gemfile or make other major changes, doing a full rebuild is the way to go.

* **light edition**: run `docker-compose up --build`
* **full rebuild**: run `docker-compose run web bundle install && docker-compose up --build`


# running rails commands

examples:

* `docker-compose run rails routes`
* `docker-compose run web rails generate controller Articles index --skip-routes`
* `docker-compose run web rake db:create`
