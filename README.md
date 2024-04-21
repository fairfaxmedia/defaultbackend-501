# 501-server (default backend)

501-server is a simple webserver that satisfies the ingress, which means it has to do two things:

 1. Serves a 501 page at `/`
 2. Serves a 200 at `/healthz`

Source code extracted from [ingress-gce][1] and modified.

[1]: https://github.com/kubernetes/ingress-gce/tree/master/cmd/404-server
