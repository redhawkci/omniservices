# omniservices docker image
This is a basic [Docker](https://www.docker.com/) image for easily running and exposing the [CORBA Naming Service](http://omniorb.sourceforge.net/omni42/omniNames.pdf) and the [CORBA Event Service](http://www.omnievents.org/)

The image can be pulled from the [Docker Hub Registry](https://registry.hub.docker.com/u/ryanbauman/omniservices/)

The default command for this image runs the omniNames and omniEvents services (via supervisor) and exposes them on ports 2809 and 11169 respectively. 

	docker run --name omniservices --detach ryanbauman/omniservices
